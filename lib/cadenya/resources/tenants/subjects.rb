# frozen_string_literal: true

module Cadenya
  module Resources
    class Tenants
      # Read and erase tenants and the subjects under them. Tenants and subjects are
      # created by assertion — on objective creation or widget session mint — never
      # directly, so this service has no create or update: it exists to enumerate what
      # assertions have produced, and to destroy it on request.
      class Subjects
        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Tenants::SubjectListParams} for more details.
        #
        # Lists the subjects asserted under a tenant. Subjects are only listable through
        # their tenant: a subject's external_id is unique within its tenant, not across
        # the workspace, so the same key can name different people under different
        # tenants.
        #
        # @overload list(tenant_id, workspace_id: nil, cursor: nil, include_info: nil, limit: nil, query: nil, sort_order: nil, request_options: {})
        #
        # @param tenant_id [String] Path param: Tenant whose subjects to list. Accepts the canonical `tenant_…` form
        #
        # @param workspace_id [String] Path param: Workspace ID.
        #
        # @param cursor [String] Query param: Pagination cursor from previous response.
        #
        # @param include_info [Boolean] Query param: When true, the `info` field on each returned subject is populated.
        #
        # @param limit [Integer] Query param: Maximum number of results to return.
        #
        # @param query [String] Query param: Substring match against the subject's name and external_id.
        #
        # @param sort_order [String] Query param: Sort order for results (asc or desc by creation time).
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Subject>]
        #
        # @see Cadenya::Models::Tenants::SubjectListParams
        def list(tenant_id, params = {})
          parsed, options = Cadenya::Tenants::SubjectListParams.dump_request(params)
          query = Cadenya::Internal::Util.encode_query_params(parsed)
          workspace_id =
            parsed.delete(:workspace_id) do
              @client.workspace_id
            end
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/tenants/%2$s/subjects", workspace_id, tenant_id],
            query: query.transform_keys(include_info: "includeInfo", sort_order: "sortOrder"),
            page: Cadenya::Internal::CursorPagination,
            model: Cadenya::Subject,
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
end
