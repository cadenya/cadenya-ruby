# frozen_string_literal: true

module Cadenya
  module Resources
    # Administer workspaces across the account: create and archive workspaces and
    # manage their membership. These operations are account-scoped and require the
    # admin role (a token whose profile holds the WorkOS admin role); they live under
    # /v1/account/workspaces rather than the workspace-scoped /v1/workspaces tree so
    # an admin can manage any workspace in the account, including ones they are not
    # themselves a member of.
    class WorkspaceAdmin
      # Administer workspaces across the account: create and archive workspaces and
      # manage their membership. These operations are account-scoped and require the
      # admin role (a token whose profile holds the WorkOS admin role); they live under
      # /v1/account/workspaces rather than the workspace-scoped /v1/workspaces tree so
      # an admin can manage any workspace in the account, including ones they are not
      # themselves a member of.
      # @return [Cadenya::Resources::WorkspaceAdmin::Members]
      attr_reader :members

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::WorkspaceAdminCreateParams} for more details.
      #
      # Creates a new workspace in the account. Admin only.
      #
      # @overload create(metadata:, spec:, request_options: {})
      #
      # @param metadata [Cadenya::Models::WorkspaceAdminCreateParams::Metadata] CreateAccountResourceMetadata contains the user-provided fields for creating
      #
      # @param spec [Cadenya::Models::WorkspaceSpec]
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Workspace]
      #
      # @see Cadenya::Models::WorkspaceAdminCreateParams
      def create(params)
        parsed, options = Cadenya::WorkspaceAdminCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/account/workspaces",
          body: parsed,
          model: Cadenya::Workspace,
          options: options
        )
      end

      # Retrieves a workspace in the account by ID. Admin only.
      #
      # @overload retrieve(workspace_id, request_options: {})
      #
      # @param workspace_id [String] Workspace ID to retrieve (path).
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Workspace]
      #
      # @see Cadenya::Models::WorkspaceAdminRetrieveParams
      def retrieve(workspace_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/account/workspaces/%1$s", workspace_id],
          model: Cadenya::Workspace,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::WorkspaceAdminListParams} for more details.
      #
      # Lists every workspace in the account, optionally including archived ones. Admin
      # only.
      #
      # @overload list(cursor: nil, include_archived: nil, limit: nil, request_options: {})
      #
      # @param cursor [String] Pagination cursor from previous response
      #
      # @param include_archived [Boolean] When true, archived workspaces are included in the results. Defaults to
      #
      # @param limit [Integer] Maximum number of results to return
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Workspace>]
      #
      # @see Cadenya::Models::WorkspaceAdminListParams
      def list(params = {})
        parsed, options = Cadenya::WorkspaceAdminListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/account/workspaces",
          query: query.transform_keys(include_archived: "includeArchived"),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::Workspace,
          options: options
        )
      end

      # Archives a workspace (soft delete). The workspace is retained, but any
      # subsequent request scoped to it returns a permission error. Archiving the
      # account's last active (non-archived) workspace is not allowed and returns
      # FailedPrecondition. Admin only.
      #
      # @overload archive(workspace_id, request_options: {})
      #
      # @param workspace_id [String] Workspace ID to archive (path).
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Cadenya::Models::WorkspaceAdminArchiveParams
      def archive(workspace_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/account/workspaces/%1$s", workspace_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Cadenya::Client]
      def initialize(client:)
        @client = client
        @members = Cadenya::Resources::WorkspaceAdmin::Members.new(client: client)
      end
    end
  end
end
