# typed: strong

module Cadenya
  module Resources
    # Read and erase tenants and the subjects under them. Tenants and subjects are
    # created by assertion — on objective creation or widget session mint — never
    # directly, so this service has no create or update: it exists to enumerate what
    # assertions have produced, and to destroy it on request.
    class Tenants
      # Read and erase tenants and the subjects under them. Tenants and subjects are
      # created by assertion — on objective creation or widget session mint — never
      # directly, so this service has no create or update: it exists to enumerate what
      # assertions have produced, and to destroy it on request.
      sig { returns(Cadenya::Resources::Tenants::Subjects) }
      attr_reader :subjects

      # Retrieves a tenant by its canonical id or by the `external_id:<value>` form the
      # customer asserted it under.
      sig do
        params(
          id: String,
          workspace_id: String,
          include_info: T::Boolean,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Tenant)
      end
      def retrieve(
        # Path param: Tenant ID. Accepts the canonical `tenant_…` form or the
        # `external_id:<value>` form.
        id,
        # Path param: Workspace ID.
        workspace_id: nil,
        # Query param: When true, the `info` field is populated.
        include_info: nil,
        request_options: {}
      )
      end

      # Lists the tenants asserted in a workspace, newest first. `query` matches against
      # a tenant's name and its external_id, for type-ahead filters.
      sig do
        params(
          workspace_id: String,
          cursor: String,
          include_info: T::Boolean,
          labels: String,
          limit: Integer,
          query: String,
          sort_order: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::Tenant])
      end
      def list(
        # Path param: Workspace ID.
        workspace_id: nil,
        # Query param: Pagination cursor from previous response.
        cursor: nil,
        # Query param: When true, the `info` field on each returned tenant is populated.
        # This costs several count queries per tenant, so it is off by default.
        include_info: nil,
        # Query param: Filters by metadata labels. Comma-separated key=value pairs, e.g.
        # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        # semantics).
        labels: nil,
        # Query param: Maximum number of results to return.
        limit: nil,
        # Query param: Substring match against the tenant's name and external_id. Built
        # for type-ahead filter pickers, where the operator knows the customer's own
        # identifier rather than Cadenya's.
        query: nil,
        # Query param: Sort order for results (asc or desc by creation time).
        sort_order: nil,
        request_options: {}
      )
      end

      # Destroys the tenant, its subjects, every objective associated with it and
      # everything reachable from those objectives, and its widget sessions. This is the
      # full erasure hammer, wider than `DELETE /widget_sessions`, which removes only
      # what widget sessions created. The work runs in the background: this returns the
      # tenant in STATE_ERASING rather than a count of what was removed, since a large
      # tenant's history cannot be destroyed inside a request. Poll the tenant to follow
      # it — STATE_ERASING while it runs, NotFound once it finishes. Erasure is
      # terminal; a tenant cannot be recovered once it starts.
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Tenant)
      end
      def delete(
        # Tenant to destroy. Accepts the canonical `tenant_…` form or the
        # `external_id:<value>` form.
        id,
        # Workspace ID.
        workspace_id: nil,
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
