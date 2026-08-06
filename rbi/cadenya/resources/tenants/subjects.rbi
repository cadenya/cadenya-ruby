# typed: strong

module Cadenya
  module Resources
    class Tenants
      # Read and erase tenants and the subjects under them. Tenants and subjects are
      # created by assertion — on objective creation or widget session mint — never
      # directly, so this service has no create or update: it exists to enumerate what
      # assertions have produced, and to destroy it on request.
      class Subjects
        # Lists the subjects asserted under a tenant. Subjects are only listable through
        # their tenant: a subject's external_id is unique within its tenant, not across
        # the workspace, so the same key can name different people under different
        # tenants.
        sig do
          params(
            tenant_id: String,
            workspace_id: String,
            cursor: String,
            include_info: T::Boolean,
            limit: Integer,
            query: String,
            sort_order: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Internal::CursorPagination[Cadenya::Subject])
        end
        def list(
          # Path param: Tenant whose subjects to list. Accepts the canonical `tenant_…` form
          # or the `external_id:<value>` form.
          tenant_id,
          # Path param: Workspace ID.
          workspace_id: nil,
          # Query param: Pagination cursor from previous response.
          cursor: nil,
          # Query param: When true, the `info` field on each returned subject is populated.
          include_info: nil,
          # Query param: Maximum number of results to return.
          limit: nil,
          # Query param: Substring match against the subject's name and external_id.
          query: nil,
          # Query param: Sort order for results (asc or desc by creation time).
          sort_order: nil,
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
