# typed: strict
# frozen_string_literal: true

module Tapioca
  module Cli
    class Annotations < ::Thor
      extend T::Sig
      # include Helper

      option :netrc, type: :boolean, default: true
      option :netrc_file, type: :string
      option :central_repo_slug, type: :string, required: true, desc: "Github slug of central repo: `org/repo`"
      desc "pull", "Pull gem annotations from a central repository"
      sig { void }
      def pull
        #   context.pull
        # rescue => e
        #   logger.error(e.message)
        #   exit(1)
      end

      option :netrc, type: :boolean, default: true
      option :netrc_file, type: :string
      option :central_repo_slug, type: :string, required: true, desc: "Github slug of central repo: `org/repo`"
      desc "push FILE", "Push gem annotations to a central repository"
      sig { params(rbi_file: String).void }
      def push(rbi_file)
        #   url = client.push_rbi_content(rbi_file)
        #   logger.success("Opened PR on central repo for `#{rbi_file}` at `#{url}`")
        # rescue => e
        #   logger.error(e.message)
        #   exit(1)
      end
    end
  end
end
