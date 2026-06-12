# typed: strong

module Cadenya
  module Resources
    # Operations on profiles, the account-level principals (users, API keys, system)
    # that authenticate against the API.
    class Profiles
      # Retrieves the profile of the authenticated caller. Useful to check which
      # principal a token belongs to.
      sig do
        params(request_options: Cadenya::RequestOptions::OrHash).returns(
          Cadenya::Profile
        )
      end
      def whoami(request_options: {})
      end

      # @api private
      sig { params(client: Cadenya::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
