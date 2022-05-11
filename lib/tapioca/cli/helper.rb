# typed: strict
# frozen_string_literal: true

module RBIClient
  module CLI
    module Helper
      extend T::Sig
      extend T::Helpers

      requires_ancestor { Thor }

      sig { returns(Context) }
      def context
        Context.new(".", logger: logger, client: client) # TODO: pass `path` as an option
      end

      sig { returns(GithubClient) }
      def client
        netrc = options[:netrc]
        netrc_file = options[:netrc_file]
        central_repo_slug = options[:central_repo_slug]

        if netrc_file && !netrc
          logger.error("Option `--netrc-file` can only be used with option `--netrc`")
          exit(1)
        end

        octokit_client = nil

        if options[:cron]
          octokit_client = GithubApp.github_client
        end

        GithubClient.new(
          netrc: ENV["VCR_CASSETTE"] && !ENV["VCR_RECORD"] ? false : netrc,
          netrc_file: netrc_file,
          central_repo_slug: central_repo_slug,
          octokit_client: octokit_client
        )
      end
    end
  end
end
