# typed: strong

module Cadenya
  module Resources
    # Mint and manage widget sessions. Session creation is server-to-server only: the
    # customer's backend authenticates its visitor, asserts tenant/subject context,
    # attaches any per-visitor secrets, and receives a short-lived bearer token the
    # browser uses against the widget host.
    class WidgetSessions
      # Mints a session against a widget and returns the session bearer token
      # (`spec.token`, returned only on creation) plus the authoritative widget hostname
      # (`info.host`). Asserting a tenant upserts the tenant record; attached secrets
      # flow to every conversation the session creates.
      sig do
        params(
          spec: Cadenya::WidgetSessionSpec::OrHash,
          workspace_id: String,
          metadata: Cadenya::CreateOperationMetadata::OrHash,
          secrets: T::Array[Cadenya::WidgetSessionCreateParams::Secret::OrHash],
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::WidgetSession)
      end
      def create(
        # Body param: WidgetSessionSpec is the configuration of a session, fixed at mint.
        spec:,
        # Path param: Workspace ID.
        workspace_id: nil,
        # Body param: CreateOperationMetadata contains the user-provided fields for
        # creating an operation. Read-only fields (id, account_id, workspace_id,
        # created_at, profile_id) are excluded since they are set by the server.
        metadata: nil,
        # Body param: Secrets to attach to the session.
        secrets: nil,
        request_options: {}
      )
      end

      # Retrieves a widget session. The bearer token is never returned on reads.
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::WidgetSession)
      end
      def retrieve(
        # Session ID. Accepts the canonical `wsess_…` form or the `external_id:<value>`
        # form.
        id,
        # Workspace ID.
        workspace_id: nil,
        request_options: {}
      )
      end

      # Lists widget sessions in a workspace, filterable by widget, tenant, subject, and
      # state
      sig do
        params(
          workspace_id: String,
          cursor: String,
          include_info: T::Boolean,
          labels: String,
          limit: Integer,
          sort_order: String,
          state: Cadenya::WidgetSessionListParams::State::OrSymbol,
          subject_id: String,
          tenant_id: String,
          widget_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::WidgetSession])
      end
      def list(
        # Path param: Workspace ID.
        workspace_id: nil,
        # Query param: Pagination cursor from previous response.
        cursor: nil,
        # Query param: When true, the `info` field on each returned session is populated.
        # Requests with this flag count more against your rate limit.
        include_info: nil,
        # Query param: Filters by metadata labels. Comma-separated key=value pairs, e.g.
        # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        # semantics).
        labels: nil,
        # Query param: Maximum number of results to return.
        limit: nil,
        # Query param: Sort order for results (asc or desc by creation time).
        sort_order: nil,
        # Query param: Filter by state.
        state: nil,
        # Query param: Filter to sessions asserted for a subject. Accepts the canonical
        # `subj_…` form or the `external_id:<value>` form; the external_id form is scoped
        # within a tenant and requires `tenant_id` to also be set.
        subject_id: nil,
        # Query param: Filter to sessions belonging to a tenant. Accepts the canonical
        # `tenant_…` form or the `external_id:<value>` form.
        tenant_id: nil,
        # Query param: Filter to sessions on a specific widget. Accepts the canonical
        # `wgt_…` form or the `external_id:<value>` form.
        widget_id: nil,
        request_options: {}
      )
      end

      # Deletes a session and its secrets. The session's conversations are
      # disassociated, not deleted; use the tenant-level delete for full erasure.
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Session ID. Accepts the canonical `wsess_…` form or the `external_id:<value>`
        # form.
        id,
        # Workspace ID.
        workspace_id: nil,
        request_options: {}
      )
      end

      # Deletes every session belonging to a tenant across all widgets in the workspace,
      # along with the conversations those sessions created — built for GDPR erasure
      # requests. The tenant is required; an empty value is rejected rather than
      # matching everything.
      sig do
        params(
          workspace_id: String,
          tenant_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Models::WidgetSessionDeleteTenantResponse)
      end
      def delete_tenant(
        # Path param: Workspace ID.
        workspace_id: nil,
        # Query param: Tenant whose sessions to delete. Required — an empty value is
        # rejected rather than matching everything. Accepts the canonical `tenant_…` form
        # or the `external_id:<value>` form.
        tenant_id: nil,
        request_options: {}
      )
      end

      # Transitions a session to STATE_REVOKED. Outstanding tokens stop working
      # immediately, open event streams close within seconds, and the session's secrets
      # are deleted. Terminal.
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::WidgetSession)
      end
      def revoke(
        # Session ID. Accepts the canonical `wsess_…` form or the `external_id:<value>`
        # form.
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
