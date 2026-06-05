# frozen_string_literal: true

module Cadenya
  module Resources
    # Read account profiles. Profiles are the account-level principals (users and API
    # keys) that can be granted access to workspaces.
    class Profiles
      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ProfileListParams} for more details.
      #
      # Lists the profiles in the current account. Supports free-form search and a type
      # filter, intended for member-picker UIs (e.g. choosing a profile to add to a
      # workspace).
      #
      # @overload list(cursor: nil, limit: nil, query: nil, type: nil, request_options: {})
      #
      # @param cursor [String] Pagination cursor from previous response
      #
      # @param limit [Integer] Maximum number of results to return
      #
      # @param query [String] Free-form search over profile name and email, for member-picker UIs.
      #
      # @param type [Symbol, Cadenya::Models::ProfileListParams::Type] Filter by profile type. Defaults to all types when unset; pass
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Profile>]
      #
      # @see Cadenya::Models::ProfileListParams
      def list(params = {})
        parsed, options = Cadenya::ProfileListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/profiles",
          query: query,
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::Profile,
          options: options
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
