# typed: strong

module Cadenya
  module Resources
    # Read account profiles. Profiles are the account-level principals (users and API
    # keys) that can be granted access to workspaces.
    class Profiles
      # Lists the profiles in the current account. Supports free-form search and a type
      # filter, intended for member-picker UIs (e.g. choosing a profile to add to a
      # workspace).
      sig do
        params(
          cursor: String,
          limit: Integer,
          query: String,
          type: Cadenya::ProfileListParams::Type::OrSymbol,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::Profile])
      end
      def list(
        # Pagination cursor from previous response
        cursor: nil,
        # Maximum number of results to return
        limit: nil,
        # Free-form search over profile name and email, for member-picker UIs.
        query: nil,
        # Filter by profile type. Defaults to all types when unset; pass PROFILE_TYPE_USER
        # to list only human users (e.g. for a member picker).
        type: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Cadenya::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
