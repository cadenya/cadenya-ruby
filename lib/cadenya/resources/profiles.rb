# frozen_string_literal: true

module Cadenya
  module Resources
    # Operations on profiles, the account-level principals (users, API keys, system)
    # that authenticate against the API.
    class Profiles
      # Retrieves the profile of the authenticated caller. Useful to check which
      # principal a token belongs to.
      #
      # @overload whoami(request_options: {})
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Profile]
      #
      # @see Cadenya::Models::ProfileWhoamiParams
      def whoami(params = {})
        @client.request(
          method: :get,
          path: "v1/whoami",
          model: Cadenya::Profile,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Cadenya::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
