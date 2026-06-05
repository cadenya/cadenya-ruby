# frozen_string_literal: true

module Cadenya
  module Resources
    # Manage workspaces within an account. Workspaces provide organizational grouping
    # and isolation for resources such as agents, tools, and API keys. Workspace
    # creation, archival, and membership management require an account administrator
    # (a token whose profile holds the admin role).
    class Workspaces
      # Manage workspaces within an account. Workspaces provide organizational grouping
      # and isolation for resources such as agents, tools, and API keys. Workspace
      # creation, archival, and membership management require an account administrator
      # (a token whose profile holds the admin role).
      # @return [Cadenya::Resources::Workspaces::Members]
      attr_reader :members

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::WorkspaceCreateParams} for more details.
      #
      # Creates a new workspace in the current account. Requires the admin role.
      #
      # @overload create(metadata:, spec:, request_options: {})
      #
      # @param metadata [Cadenya::Models::WorkspaceCreateParams::Metadata] CreateAccountResourceMetadata contains the user-provided fields for creating
      #
      # @param spec [Cadenya::Models::WorkspaceSpec]
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Workspace]
      #
      # @see Cadenya::Models::WorkspaceCreateParams
      def create(params)
        parsed, options = Cadenya::WorkspaceCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/workspaces",
          body: parsed,
          model: Cadenya::Workspace,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::WorkspaceRetrieveParams} for more details.
      #
      # Retrieves a workspace by ID from the current account.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] Workspace ID. Accepts the canonical workspace ID or the
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Workspace]
      #
      # @see Cadenya::Models::WorkspaceRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s", id],
          model: Cadenya::Workspace,
          options: params[:request_options]
        )
      end

      # Lists all workspaces for the current account
      #
      # @overload list(cursor: nil, include_info: nil, limit: nil, sort_order: nil, request_options: {})
      #
      # @param cursor [String] Pagination cursor from previous response
      #
      # @param include_info [Boolean] When set to true you may use more of your alloted API rate-limit
      #
      # @param limit [Integer] Maximum number of results to return
      #
      # @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Workspace>]
      #
      # @see Cadenya::Models::WorkspaceListParams
      def list(params = {})
        parsed, options = Cadenya::WorkspaceListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/workspaces",
          query: query.transform_keys(include_info: "includeInfo", sort_order: "sortOrder"),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::Workspace,
          options: options
        )
      end

      # Archives a workspace. This is a soft delete: the workspace is retained but any
      # subsequent request scoped to it returns a permission error. Requires the admin
      # role.
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] Workspace ID to archive.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Cadenya::Models::WorkspaceDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/workspaces/%1$s", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Retrieves the workspace associated with the current API token. Useful for
      # workspace-scoped tokens to identify which workspace they belong to.
      #
      # @overload get_current(request_options: {})
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Workspace]
      #
      # @see Cadenya::Models::WorkspaceGetCurrentParams
      def get_current(params = {})
        @client.request(
          method: :get,
          path: "v1/workspaces/current",
          model: Cadenya::Workspace,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Cadenya::Client]
      def initialize(client:)
        @client = client
        @members = Cadenya::Resources::Workspaces::Members.new(client: client)
      end
    end
  end
end
