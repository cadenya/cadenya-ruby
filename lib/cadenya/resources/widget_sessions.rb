# frozen_string_literal: true

module Cadenya
  module Resources
    # Mint and manage widget sessions. Session creation is server-to-server only: the
    # customer's backend authenticates its visitor, asserts tenant/subject context,
    # attaches any per-visitor secrets, and receives a short-lived bearer token the
    # browser uses against the widget host.
    class WidgetSessions
      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::WidgetSessionCreateParams} for more details.
      #
      # Mints a session against a widget and returns the session bearer token
      # (`spec.token`, returned only on creation) plus the authoritative widget hostname
      # (`info.host`). Asserting a tenant upserts the tenant record; attached secrets
      # flow to every conversation the session creates.
      #
      # @overload create(spec:, workspace_id: nil, metadata: nil, secrets: nil, request_options: {})
      #
      # @param spec [Cadenya::Models::WidgetSessionSpec] Body param: WidgetSessionSpec is the configuration of a session, fixed at mint.
      #
      # @param workspace_id [String] Path param: Workspace ID.
      #
      # @param metadata [Cadenya::Models::CreateOperationMetadata] Body param: CreateOperationMetadata contains the user-provided fields for creati
      #
      # @param secrets [Array<Cadenya::Models::WidgetSessionCreateParams::Secret>] Body param: Secrets to attach to the session.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::WidgetSession]
      #
      # @see Cadenya::Models::WidgetSessionCreateParams
      def create(params)
        parsed, options = Cadenya::WidgetSessionCreateParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/widget_sessions", workspace_id],
          body: parsed,
          model: Cadenya::WidgetSession,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::WidgetSessionRetrieveParams} for more details.
      #
      # Retrieves a widget session. The bearer token is never returned on reads.
      #
      # @overload retrieve(id, workspace_id: nil, request_options: {})
      #
      # @param id [String] Session ID. Accepts the canonical `wsess_…` form or the `external_id:<value>` fo
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::WidgetSession]
      #
      # @see Cadenya::Models::WidgetSessionRetrieveParams
      def retrieve(id, params = {})
        parsed, options = Cadenya::WidgetSessionRetrieveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/widget_sessions/%2$s", workspace_id, id],
          model: Cadenya::WidgetSession,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::WidgetSessionListParams} for more details.
      #
      # Lists widget sessions in a workspace, filterable by widget, tenant, subject, and
      # state
      #
      # @overload list(workspace_id: nil, cursor: nil, include_info: nil, labels: nil, limit: nil, sort_order: nil, state: nil, subject_id: nil, tenant_id: nil, widget_id: nil, request_options: {})
      #
      # @param workspace_id [String] Path param: Workspace ID.
      #
      # @param cursor [String] Query param: Pagination cursor from previous response.
      #
      # @param include_info [Boolean] Query param: When true, the `info` field on each returned session is populated.
      #
      # @param labels [String] Query param: Filters by metadata labels. Comma-separated key=value pairs,
      #
      # @param limit [Integer] Query param: Maximum number of results to return.
      #
      # @param sort_order [String] Query param: Sort order for results (asc or desc by creation time).
      #
      # @param state [Symbol, Cadenya::Models::WidgetSessionListParams::State] Query param: Filter by state.
      #
      # @param subject_id [String] Query param: Filter to sessions asserted for a subject. Accepts the canonical
      #
      # @param tenant_id [String] Query param: Filter to sessions belonging to a tenant. Accepts the canonical
      #
      # @param widget_id [String] Query param: Filter to sessions on a specific widget. Accepts the canonical `wgt
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::WidgetSession>]
      #
      # @see Cadenya::Models::WidgetSessionListParams
      def list(params = {})
        parsed, options = Cadenya::WidgetSessionListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/widget_sessions", workspace_id],
          query: query.transform_keys(
            include_info: "includeInfo",
            sort_order: "sortOrder",
            subject_id: "subjectId",
            tenant_id: "tenantId",
            widget_id: "widgetId"
          ),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::WidgetSession,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::WidgetSessionDeleteParams} for more details.
      #
      # Deletes a session and its secrets. The session's conversations are
      # disassociated, not deleted; use the tenant-level delete for full erasure.
      #
      # @overload delete(id, workspace_id: nil, request_options: {})
      #
      # @param id [String] Session ID. Accepts the canonical `wsess_…` form or the `external_id:<value>` fo
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Cadenya::Models::WidgetSessionDeleteParams
      def delete(id, params = {})
        parsed, options = Cadenya::WidgetSessionDeleteParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :delete,
          path: ["v1/workspaces/%1$s/widget_sessions/%2$s", workspace_id, id],
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::WidgetSessionDeleteTenantParams} for more details.
      #
      # Deletes every session belonging to a tenant across all widgets in the workspace,
      # along with the conversations those sessions created — built for GDPR erasure
      # requests. The tenant is required; an empty value is rejected rather than
      # matching everything.
      #
      # @overload delete_tenant(workspace_id: nil, tenant_id: nil, request_options: {})
      #
      # @param workspace_id [String] Path param: Workspace ID.
      #
      # @param tenant_id [String] Query param: Tenant whose sessions to delete. Required — an empty value is rejec
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::WidgetSessionDeleteTenantResponse]
      #
      # @see Cadenya::Models::WidgetSessionDeleteTenantParams
      def delete_tenant(params = {})
        parsed, options = Cadenya::WidgetSessionDeleteTenantParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :delete,
          path: ["v1/workspaces/%1$s/widget_sessions", workspace_id],
          query: query.transform_keys(tenant_id: "tenantId"),
          model: Cadenya::Models::WidgetSessionDeleteTenantResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::WidgetSessionRevokeParams} for more details.
      #
      # Transitions a session to STATE_REVOKED. Outstanding tokens stop working
      # immediately, open event streams close within seconds, and the session's secrets
      # are deleted. Terminal.
      #
      # @overload revoke(id, workspace_id: nil, request_options: {})
      #
      # @param id [String] Session ID. Accepts the canonical `wsess_…` form or the `external_id:<value>` fo
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::WidgetSession]
      #
      # @see Cadenya::Models::WidgetSessionRevokeParams
      def revoke(id, params = {})
        parsed, options = Cadenya::WidgetSessionRevokeParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/widget_sessions/%2$s:revoke", workspace_id, id],
          model: Cadenya::WidgetSession,
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
