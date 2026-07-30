# frozen_string_literal: true

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
      # @return [Cadenya::Resources::Tenants::Subjects]
      attr_reader :subjects

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::TenantRetrieveParams} for more details.
      #
      # Retrieves a tenant by its canonical id or by the `external_id:<value>` form the
      # customer asserted it under.
      #
      # @overload retrieve(id, workspace_id: nil, include_info: nil, request_options: {})
      #
      # @param id [String] Path param: Tenant ID. Accepts the canonical `tenant_…` form or the
      #
      # @param workspace_id [String] Path param: Workspace ID.
      #
      # @param include_info [Boolean] Query param: When true, the `info` field is populated.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Tenant]
      #
      # @see Cadenya::Models::TenantRetrieveParams
      def retrieve(id, params = {})
        parsed, options = Cadenya::TenantRetrieveParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/tenants/%2$s", workspace_id, id],
          query: query.transform_keys(include_info: "includeInfo"),
          model: Cadenya::Tenant,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::TenantListParams} for more details.
      #
      # Lists the tenants asserted in a workspace, newest first. `query` matches against
      # a tenant's name and its external_id, for type-ahead filters.
      #
      # @overload list(workspace_id: nil, cursor: nil, include_info: nil, labels: nil, limit: nil, query: nil, sort_order: nil, request_options: {})
      #
      # @param workspace_id [String] Path param: Workspace ID.
      #
      # @param cursor [String] Query param: Pagination cursor from previous response.
      #
      # @param include_info [Boolean] Query param: When true, the `info` field on each returned tenant is populated. T
      #
      # @param labels [String] Query param: Filters by metadata labels. Comma-separated key=value pairs,
      #
      # @param limit [Integer] Query param: Maximum number of results to return.
      #
      # @param query [String] Query param: Substring match against the tenant's name and external_id. Built fo
      #
      # @param sort_order [String] Query param: Sort order for results (asc or desc by creation time).
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Tenant>]
      #
      # @see Cadenya::Models::TenantListParams
      def list(params = {})
        parsed, options = Cadenya::TenantListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/tenants", workspace_id],
          query: query.transform_keys(include_info: "includeInfo", sort_order: "sortOrder"),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::Tenant,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::TenantDeleteParams} for more details.
      #
      # Destroys the tenant, its subjects, every objective associated with it and
      # everything reachable from those objectives, and its widget sessions. This is the
      # full erasure hammer, wider than `DELETE /widget_sessions`, which removes only
      # what widget sessions created. The work runs in the background: this returns the
      # tenant in STATE_ERASING rather than a count of what was removed, since a large
      # tenant's history cannot be destroyed inside a request. Poll the tenant to follow
      # it — STATE_ERASING while it runs, NotFound once it finishes. Erasure is
      # terminal; a tenant cannot be recovered once it starts.
      #
      # @overload delete(id, workspace_id: nil, request_options: {})
      #
      # @param id [String] Tenant to destroy. Accepts the canonical `tenant_…` form or the
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Tenant]
      #
      # @see Cadenya::Models::TenantDeleteParams
      def delete(id, params = {})
        parsed, options = Cadenya::TenantDeleteParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :delete,
          path: ["v1/workspaces/%1$s/tenants/%2$s", workspace_id, id],
          model: Cadenya::Tenant,
          options: options
        )
      end

      # @api private
      #
      # @param client [Cadenya::Client]
      def initialize(client:)
        @client = client
        @subjects = Cadenya::Resources::Tenants::Subjects.new(client: client)
      end
    end
  end
end
