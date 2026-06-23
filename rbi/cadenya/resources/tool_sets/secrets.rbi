# typed: strong

module Cadenya
  module Resources
    class ToolSets
      # Manage tool sets and the tools they contain. Tool sets group related tools, and
      # tools define specific capabilities available to agents.
      #
      # When a tool set is managed, only API key actors can modify its tools; human
      # (profile) actors cannot.
      class Secrets
        # Creates a new secret scoped to the tool set
        sig do
          params(
            tool_set_id: String,
            workspace_id: String,
            metadata: Cadenya::CreateResourceMetadata::OrHash,
            spec: Cadenya::ToolSets::ToolSetSecretSpec::OrHash,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::ToolSets::ToolSetSecret)
        end
        def create(
          # Path param: The tool set that will own this secret. Accepts the canonical ts\_…
          # form or the external_id:<value> form.
          tool_set_id,
          # Path param: The workspace that owns the tool set.
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

        # Retrieves a tool set secret by ID from the tool set
        sig do
          params(
            id: String,
            workspace_id: String,
            tool_set_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::ToolSets::ToolSetSecret)
        end
        def retrieve(
          # The secret to retrieve.
          id,
          # The workspace that owns the tool set.
          workspace_id:,
          # The tool set the secret belongs to. Accepts the canonical ts\_… form or the
          # external_id:<value> form.
          tool_set_id:,
          request_options: {}
        )
        end

        # Updates a secret scoped to the tool set
        sig do
          params(
            id: String,
            workspace_id: String,
            tool_set_id: String,
            metadata: Cadenya::UpdateResourceMetadata::OrHash,
            spec: Cadenya::ToolSets::ToolSetSecretSpec::OrHash,
            update_mask: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::ToolSets::ToolSetSecret)
        end
        def update(
          # Path param: The secret to update.
          id,
          # Path param: The workspace that owns the tool set.
          workspace_id:,
          # Path param: The tool set the secret belongs to. Accepts the canonical ts\_… form
          # or the external_id:<value> form.
          tool_set_id:,
          # Body param: UpdateResourceMetadata contains the user-provided fields for
          # updating a workspace-scoped resource. Read-only fields (id, account_id,
          # workspace_id, profile_id, created_at) are excluded since they are set by the
          # server.
          metadata: nil,
          # Body param
          spec: nil,
          # Body param: Fields to update.
          update_mask: nil,
          request_options: {}
        )
        end

        # Lists all secrets scoped to the tool set
        sig do
          params(
            tool_set_id: String,
            workspace_id: String,
            cursor: String,
            include_info: T::Boolean,
            limit: Integer,
            prefix: String,
            query: String,
            sort_order: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(
            Cadenya::Internal::CursorPagination[
              Cadenya::ToolSets::ToolSetSecret
            ]
          )
        end
        def list(
          # Path param: The tool set whose secrets will be listed. Accepts the canonical
          # ts\_… form or the external_id:<value> form.
          tool_set_id,
          # Path param: The workspace that owns the tool set.
          workspace_id:,
          # Query param: Pagination cursor from previous response
          cursor: nil,
          # Query param: When set to true you may use more of your alloted API rate-limit
          include_info: nil,
          # Query param: Maximum number of results to return
          limit: nil,
          # Query param: Filter expression (query param: prefix)
          prefix: nil,
          # Query param: Free-form search query
          query: nil,
          # Query param: Sort order for results (asc or desc by creation time)
          sort_order: nil,
          request_options: {}
        )
        end

        # Deletes a secret scoped to the tool set
        sig do
          params(
            id: String,
            workspace_id: String,
            tool_set_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).void
        end
        def delete(
          # The secret to delete.
          id,
          # The workspace that owns the tool set.
          workspace_id:,
          # The tool set the secret belongs to. Accepts the canonical ts\_… form or the
          # external_id:<value> form.
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
