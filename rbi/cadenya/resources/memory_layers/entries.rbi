# typed: strong

module Cadenya
  module Resources
    class MemoryLayers
      # Manage memory layers and their entries. Layers are named containers that can be
      # composed into an objective's memory cascade; entries are the keyed values within
      # a layer. System-managed layers (e.g., episodic layers created by the runtime)
      # cannot be mutated through this API.
      class Entries
        # Creates a new entry in a memory layer. Returns the detail view, including the
        # resolved content body.
        sig do
          params(
            memory_layer_id: String,
            metadata: Cadenya::CreateResourceMetadata::OrHash,
            spec: Cadenya::MemoryLayers::MemoryEntryCreateSpec::OrHash,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::MemoryLayers::MemoryEntryDetail)
        end
        def create(
          # Path param: Memory layer ID. Accepts canonical memlyr\_… form or
          # external_id:<value> form.
          memory_layer_id,
          # Body param: CreateResourceMetadata contains the user-provided fields for
          # creating a workspace-scoped resource. Read-only fields (id, account_id,
          # workspace_id, profile_id, created_at) are excluded since they are set by the
          # server.
          metadata:,
          # Body param: MemoryEntryCreateSpec is the input shape for CreateMemoryEntry. It
          # accepts either inline content or a reference to a completed Upload; exactly one
          # of the two must be set.
          spec:,
          # Path param
          workspace_id: nil,
          request_options: {}
        )
        end

        # Retrieves a memory entry by ID from a memory layer. Returns the detail view,
        # including the content body.
        sig do
          params(
            memory_layer_id: String,
            id: String,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::MemoryLayers::MemoryEntryDetail)
        end
        def retrieve(
          # Memory layer ID. Accepts canonical memlyr\_… form or external_id:<value> form.
          memory_layer_id,
          id,
          workspace_id: nil,
          request_options: {}
        )
        end

        # Updates a memory entry in a memory layer. Returns the detail view, including the
        # resolved content body.
        sig do
          params(
            memory_layer_id: String,
            id: String,
            workspace_id: String,
            metadata: Cadenya::UpdateResourceMetadata::OrHash,
            spec: Cadenya::MemoryLayers::MemoryEntryUpdateSpec::OrHash,
            update_mask: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::MemoryLayers::MemoryEntryDetail)
        end
        def update(
          # Path param: Memory layer ID. Accepts canonical memlyr\_… form or
          # external_id:<value> form.
          memory_layer_id,
          # Path param
          id,
          # Path param
          workspace_id: nil,
          # Body param: UpdateResourceMetadata contains the user-provided fields for
          # updating a workspace-scoped resource. Read-only fields (id, account_id,
          # workspace_id, profile_id, created_at) are excluded since they are set by the
          # server.
          metadata: nil,
          # Body param: MemoryEntryUpdateSpec is the input shape for UpdateMemoryEntry.
          # Fields present in the request's update_mask are applied; unset fields are left
          # alone. The source oneof is optional for updates — omit it to leave the body
          # untouched, or set exactly one branch to replace it.
          spec: nil,
          # Body param
          update_mask: nil,
          request_options: {}
        )
        end

        # Lists all entries in a memory layer
        sig do
          params(
            memory_layer_id: String,
            workspace_id: String,
            cursor: String,
            include_info: T::Boolean,
            labels: String,
            limit: Integer,
            prefix: String,
            query: String,
            sort_order: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(
            Cadenya::Internal::CursorPagination[
              Cadenya::MemoryLayers::MemoryEntry
            ]
          )
        end
        def list(
          # Path param: Memory layer ID. Accepts canonical memlyr\_… form or
          # external_id:<value> form.
          memory_layer_id,
          # Path param
          workspace_id: nil,
          # Query param: Pagination cursor from previous response
          cursor: nil,
          # Query param: When set to true you may use more of your alloted API rate-limit
          include_info: nil,
          # Query param: Filters by metadata labels. Comma-separated key=value pairs, e.g.
          # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
          # semantics).
          labels: nil,
          # Query param: Maximum number of results to return
          limit: nil,
          # Query param: Filter by key prefix (e.g., "skills/postmortem/" to list all
          # entries under that hierarchy). Matches against the entry's key, not its name.
          prefix: nil,
          # Query param: Free-form search query
          query: nil,
          # Query param: Sort order for results (asc or desc by creation time)
          sort_order: nil,
          request_options: {}
        )
        end

        # Deletes a memory entry from a memory layer
        sig do
          params(
            memory_layer_id: String,
            id: String,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).void
        end
        def delete(
          # Memory layer ID. Accepts canonical memlyr\_… form or external_id:<value> form.
          memory_layer_id,
          id,
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
end
