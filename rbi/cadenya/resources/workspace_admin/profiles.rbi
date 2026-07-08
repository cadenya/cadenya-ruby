# typed: strong

module Cadenya
  module Resources
    class WorkspaceAdmin
      # Administer workspaces across the account: create and archive workspaces and
      # manage their membership. These operations are account-scoped and require the
      # admin role (a token whose profile holds the WorkOS admin role); they live under
      # /v1/account/workspaces rather than the workspace-scoped /v1/workspaces tree so
      # an admin can manage any workspace in the account, including ones they are not
      # themselves a member of.
      class Profiles
        # Searches the account's profiles for a member picker, with free-form name/email
        # search and an optional type filter. Account-scoped; admin only.
        sig do
          params(
            cursor: String,
            labels: String,
            limit: Integer,
            query: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Internal::CursorPagination[Cadenya::Profile])
        end
        def list(
          # Pagination cursor from previous response
          cursor: nil,
          # Filters by metadata labels. Comma-separated key=value pairs, e.g.
          # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
          # semantics).
          labels: nil,
          # Maximum number of results to return
          limit: nil,
          # Free-form search over profile name and email. Case-insensitive substring match;
          # empty returns all profiles.
          query: nil,
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
end
