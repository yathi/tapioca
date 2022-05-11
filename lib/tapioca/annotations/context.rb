# typed: strict
# frozen_string_literal: true

module Tapioca
  # The context (ie repo or project) where `tapioca` is running
  class Context
    extend T::Sig

    IGNORED_GEMS = T.let(["sorbet", "sorbet-runtime", "sorbet-static"], T::Array[String])

    sig { returns(String) }
    attr_reader :path

    sig { returns(Logger) }
    attr_reader :logger

    sig { params(path: String, logger: Logger, client: GithubClient).void }
    def initialize(path, logger: Logger.new, client: GithubClient.new)
      @path = path
      @logger = logger
      @client = client
    end

    # Actions

    sig { void }
    def pull
      index = @client.index

      parser = gemfile_lock_parser
      gem_names = parser.specs.map(&:name).select do |name|
        index.has_gem?(name)
      end

      fetched_gems = gem_names.select { |name| fetch_annotation(name) }
      remove_expired_annotations(fetched_gems)
    end

    # Utils

    sig { params(name: String).void }
    def fetch_annotation(name)
      content = @client.pull_rbi_content(name)
      return false unless content

      content = add_header(content)

      dir = rbi_annotations_dir
      FileUtils.mkdir_p(dir)
      File.write("#{dir}/#{name}.rbi", content)
      @logger.success("Pulled `#{name}.rbi` from central repository")
    rescue GithubClient::FetchError => e
      @logger.error(e.message)
      exit(1)
    end

    sig { params(fetched_annotations: T::Array[String]).void }
    def remove_expired_annotations(fetched_annotations)
      existing_rbis = Pathname.glob("#{rbi_annotations_dir}/*.rbi".to_s).map { |f| f.basename(".*").to_s }
      expired_rbis = existing_rbis - fetched_annotations

      if expired_rbis.any?
        @logger.info("Removing expired annotations")
        expired_rbis.each do |filename|
          path = "#{rbi_annotations_dir}/#{filename}.rbi"
          FileUtils.rm(path)
          @logger.debug("Removed #{path}")
        end
        @logger.info("Done")
      end
    end

    sig { params(content: String).returns(String) }
    def add_header(content)
      header = <<~COMMENT
        # DO NOT EDIT MANUALLY
        # This file was pulled from `github.com/Shopify/rbi-repo`.
        # Please instead contribute to the above repo.
      COMMENT

      contents = content.split("\n")
      if contents[0]&.start_with?("# typed:") && contents[1]&.empty?
        contents.insert(2, header).join("\n")
      else
        @logger.debug("Couldn't insert file header for content: #{content} due to unexpected file format")
        content
      end
    end

    sig { returns(String) }
    def rbi_annotations_dir
      (root_pathname / "sorbet/rbi/annotations").to_s
    end

    sig { returns(String) }
    def rbi_gems_dir
      (root_pathname / "sorbet/rbi/gems").to_s
    end

    private

    sig { returns(String) }
    def gemfile_lock_path
      (root_pathname / "Gemfile.lock").to_s
    end

    sig { returns(Bundler::LockfileParser) }
    def gemfile_lock_parser
      file = Bundler.read_file(gemfile_lock_path)
      Bundler::LockfileParser.new(file)
    end

    sig { returns(Pathname) }
    def root_pathname
      Pathname.new(@path)
    end

    sig { params(path: String).void }
    def check_file_exists(path)
      unless File.file?(path)
        logger.error("Can't read file `#{path}`.")
        exit(1)
      end
    end

    sig { params(path: String).returns(RBI::Tree) }
    def parse_file(path)
      check_file_exists(path)
      RBI::Parser.parse_file(path)
    rescue RBI::ParseError => e
      logger.error("Parse error in `#{path}`: #{e.message}.")
      exit(1)
    end
  end
end
