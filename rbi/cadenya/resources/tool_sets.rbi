# typed: strong

module Cadenya
  module Resources
    # Manage tool sets and the tools they contain. Tool sets group related tools, and
    # tools define specific capabilities available to agents.
    #
    # When a tool set is managed, only API key actors can modify its tools; human
    # (profile) actors cannot.
    class ToolSets
      # Manage tool sets and the tools they contain. Tool sets group related tools, and
      # tools define specific capabilities available to agents.
      #
      # When a tool set is managed, only API key actors can modify its tools; human
      # (profile) actors cannot.
      sig { returns(Cadenya::Resources::ToolSets::Tools) }
      attr_reader :tools

      # Creates a new tool set in the workspace
      sig do
        params(
          workspace_id: String,
          metadata: Cadenya::CreateResourceMetadata::OrHash,
          spec: Cadenya::ToolSetSpec::OrHash,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::ToolSet)
      end
      def create(
        # Workspace ID.
        workspace_id,
        # CreateResourceMetadata contains the user-provided fields for creating a
        # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        # profile_id, created_at) are excluded since they are set by the server.
        metadata:,
        spec:,
        request_options: {}
      )
      end

      # Retrieves a tool set by ID from the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::ToolSet)
      end
      def retrieve(
        # Tool set ID. Accepts the canonical ts\_… form or the external_id:<value> form.
        id,
        # Workspace ID.
        workspace_id:,
        request_options: {}
      )
      end

      # Updates a tool set in the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          metadata: Cadenya::UpdateResourceMetadata::OrHash,
          spec: Cadenya::ToolSetSpec::OrHash,
          update_mask: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::ToolSet)
      end
      def update(
        # Path param: Tool set ID. Accepts the canonical ts\_… form or the
        # external_id:<value> form.
        id,
        # Path param: Workspace ID.
        workspace_id:,
        # Body param: UpdateResourceMetadata contains the user-provided fields for
        # updating a workspace-scoped resource. Read-only fields (id, account_id,
        # workspace_id, profile_id, created_at) are excluded since they are set by the
        # server.
        metadata: nil,
        # Body param
        spec: nil,
        # Body param
        update_mask: nil,
        request_options: {}
      )
      end

      # Lists all tool sets in the workspace
      sig do
        params(
          workspace_id: String,
          bundle_key: String,
          cursor: String,
          include_info: T::Boolean,
          limit: Integer,
          prefix: String,
          query: String,
          sort_order: String,
          state: Cadenya::ToolSetListParams::State::OrSymbol,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::ToolSet])
      end
      def list(
        # Workspace ID.
        workspace_id,
        # Filter by bundle_key — return only resources owned by this bundle.
        bundle_key: nil,
        # Pagination cursor from previous response
        cursor: nil,
        # When set to true you may use more of your alloted API rate-limit
        include_info: nil,
        # Maximum number of results to return
        limit: nil,
        # Filter expression (query param: prefix)
        prefix: nil,
        # Free-form search query
        query: nil,
        # Sort order for results (asc or desc by creation time)
        sort_order: nil,
        # Filter by tool set lifecycle state. Defaults to STATE_ACTIVE when unspecified;
        # pass STATE_ARCHIVED to list archived tool sets.
        state: nil,
        request_options: {}
      )
      end

      # Deletes a tool set in the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Tool set ID. Accepts the canonical ts\_… form or the external_id:<value> form.
        id,
        # Workspace ID.
        workspace_id:,
        request_options: {}
      )
      end

      # Transitions a tool set to STATE_ARCHIVED. Syncing stops, the tool set is hidden
      # from list results, its tools are no longer offered to objectives, and new
      # variation assignments are rejected. Existing assignments are retained, and
      # history is preserved — unlike delete, archiving works while the tool set is
      # still assigned to agent variations.
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::ToolSet)
      end
      def archive(
        # Tool set ID. Accepts the canonical ts\_… form or the external_id:<value> form.
        id,
        # Workspace ID.
        workspace_id:,
        request_options: {}
      )
      end

      # Retrieves the current OpenAPI specification JSON that has been consumed by the
      # tool set. Only applicable to tool sets using the OpenAPI adapter.
      sig do
        params(
          tool_set_id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Models::ToolSetGetOpenAPISpecResponse)
      end
      def get_openapi_spec(
        # Tool set ID. Accepts the canonical ts\_… form or the external_id:<value> form.
        tool_set_id,
        # Workspace ID.
        workspace_id:,
        request_options: {}
      )
      end

      # Lists all events (including sync status) for a tool set
      sig do
        params(
          tool_set_id: String,
          workspace_id: String,
          cursor: String,
          include_info: T::Boolean,
          limit: Integer,
          sort_order: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::ToolSetEvent])
      end
      def list_events(
        # Path param: Tool set ID. Accepts the canonical ts\_… form or the
        # external_id:<value> form.
        tool_set_id,
        # Path param: Workspace ID.
        workspace_id:,
        # Query param: Pagination cursor from previous response
        cursor: nil,
        # Query param: When set to true you may use more of your alloted API rate-limit
        include_info: nil,
        # Query param: Maximum number of results to return
        limit: nil,
        # Query param: Sort order for results (asc or desc by creation time)
        sort_order: nil,
        request_options: {}
      )
      end

      # Transitions an archived tool set back to STATE_ACTIVE. Managed tool sets resume
      # syncing on their next cycle and their tools become available to objectives
      # again.
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::ToolSet)
      end
      def unarchive(
        # Tool set ID. Accepts the canonical ts\_… form or the external_id:<value> form.
        id,
        # Workspace ID.
        workspace_id:,
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
