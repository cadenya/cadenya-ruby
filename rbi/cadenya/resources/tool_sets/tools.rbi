# typed: strong

module Cadenya
  module Resources
    class ToolSets
      # Manage tool sets and the tools they contain. Tool sets group related tools, and
      # tools define specific capabilities available to agents.
      #
      # When a tool set is managed, only API key actors can modify its tools; human
      # (profile) actors cannot.
      class Tools
        # Creates a new tool in the tool set
        sig do
          params(
            tool_set_id: String,
            workspace_id: String,
            metadata: Cadenya::CreateResourceMetadata::OrHash,
            spec: Cadenya::ToolSets::ToolSpec::OrHash,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::ToolSets::Tool)
        end
        def create(
          # Path param: Tool set ID. Accepts the canonical ts\_… form or the
          # external_id:<value> form.
          tool_set_id,
          # Path param: Workspace ID.
          workspace_id:,
          # Body param: CreateResourceMetadata contains the user-provided fields for
          # creating a workspace-scoped resource. Read-only fields (id, account_id,
          # workspace_id, profile_id, created_at) are excluded since they are set by the
          # server.
          metadata:,
          # Body param
          spec:,
          request_options: {}
        )
        end

        # Retrieves a tool by ID from the workspace
        sig do
          params(
            id: String,
            workspace_id: String,
            tool_set_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::ToolSets::Tool)
        end
        def retrieve(
          # Tool ID. Accepts the canonical tool\_… form or the external_id:<value> form.
          id,
          # Workspace ID.
          workspace_id:,
          # Tool set ID. Accepts the canonical ts\_… form or the external_id:<value> form.
          tool_set_id:,
          request_options: {}
        )
        end

        # Updates a tool in the tool set
        sig do
          params(
            id: String,
            workspace_id: String,
            tool_set_id: String,
            metadata: Cadenya::UpdateResourceMetadata::OrHash,
            spec: Cadenya::ToolSets::ToolSpec::OrHash,
            update_mask: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::ToolSets::Tool)
        end
        def update(
          # Path param: Tool ID. Accepts the canonical tool\_… form or the
          # external_id:<value> form.
          id,
          # Path param: Workspace ID.
          workspace_id:,
          # Path param: Tool set ID. Accepts the canonical ts\_… form or the
          # external_id:<value> form.
          tool_set_id:,
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

        # Lists all tools in the tool set
        sig do
          params(
            tool_set_id: String,
            workspace_id: String,
            bundle_key: String,
            cursor: String,
            include_info: T::Boolean,
            limit: Integer,
            names: T::Array[String],
            prefix: String,
            query: String,
            requires_approval: T::Boolean,
            sort_order: String,
            statuses:
              T::Array[Cadenya::ToolSets::ToolListParams::Status::OrSymbol],
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(
            Cadenya::Internal::CursorPagination[Cadenya::ToolSets::Tool]
          )
        end
        def list(
          # Path param: Tool set ID. Accepts the canonical ts\_… form or the
          # external_id:<value> form.
          tool_set_id,
          # Path param: Workspace ID.
          workspace_id:,
          # Query param: Filter by bundle_key — return only resources owned by this bundle.
          bundle_key: nil,
          # Query param: Pagination cursor from previous response
          cursor: nil,
          # Query param: When set to true you may use more of your alloted API rate-limit
          include_info: nil,
          # Query param: Maximum number of results to return
          limit: nil,
          # Query param: Filter by tool name (exact match). Multiple values are OR'd
          # together.
          names: nil,
          # Query param: Filter expression (query param: prefix)
          prefix: nil,
          # Query param: Free-form search query
          query: nil,
          # Query param: Filter by approval requirement. Omitted = no filter; true = only
          # tools requiring approval; false = only tools not requiring approval.
          requires_approval: nil,
          # Query param: Sort order for results (asc or desc by creation time)
          sort_order: nil,
          # Query param: Filter by tool status. Multiple values are OR'd together.
          statuses: nil,
          request_options: {}
        )
        end

        # Deletes a tool in the tool set
        sig do
          params(
            id: String,
            workspace_id: String,
            tool_set_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).void
        end
        def delete(
          # Tool ID. Accepts the canonical tool\_… form or the external_id:<value> form.
          id,
          # Workspace ID.
          workspace_id:,
          # Tool set ID. Accepts the canonical ts\_… form or the external_id:<value> form.
          tool_set_id:,
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
