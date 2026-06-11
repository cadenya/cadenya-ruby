# typed: strong

module Cadenya
  module Resources
    # Manage memory layers and their entries. Layers are named containers that can be
    # composed into an objective's memory stack; entries are the keyed values within a
    # layer. System-managed layers (e.g., episodic layers created by the runtime)
    # cannot be mutated through this API.
    class MemoryLayers
      # Manage memory layers and their entries. Layers are named containers that can be
      # composed into an objective's memory stack; entries are the keyed values within a
      # layer. System-managed layers (e.g., episodic layers created by the runtime)
      # cannot be mutated through this API.
      sig { returns(Cadenya::Resources::MemoryLayers::Entries) }
      attr_reader :entries

      # Creates a new memory layer in the workspace
      sig do
        params(
          workspace_id: String,
          metadata: Cadenya::CreateResourceMetadata::OrHash,
          spec: Cadenya::MemoryLayerSpec::OrHash,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::MemoryLayer)
      end
      def create(
        workspace_id,
        # CreateResourceMetadata contains the user-provided fields for creating a
        # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        # profile_id, created_at) are excluded since they are set by the server.
        metadata:,
        spec:,
        request_options: {}
      )
      end

      # Retrieves a memory layer by ID from the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::MemoryLayer)
      end
      def retrieve(
        # Memory layer ID. Accepts canonical memlyr\_… form or external_id:<value> form.
        id,
        workspace_id:,
        request_options: {}
      )
      end

      # Updates a memory layer in the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          metadata: Cadenya::UpdateResourceMetadata::OrHash,
          spec: Cadenya::MemoryLayerSpec::OrHash,
          update_mask: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::MemoryLayer)
      end
      def update(
        # Path param: Memory layer ID. Accepts canonical memlyr\_… form or
        # external_id:<value> form.
        id,
        # Path param
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

      # Lists all memory layers in the workspace
      sig do
        params(
          workspace_id: String,
          agent_id: String,
          bundle_key: String,
          cursor: String,
          episodic_key_prefix: String,
          include_info: T::Boolean,
          limit: Integer,
          prefix: String,
          query: String,
          sort_order: String,
          type: Cadenya::MemoryLayerListParams::Type::OrSymbol,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::MemoryLayer])
      end
      def list(
        workspace_id,
        # Filter to episodic layers belonging to this agent.
        agent_id: nil,
        # Filter by bundle_key — return only resources owned by this bundle.
        bundle_key: nil,
        # Pagination cursor from previous response
        cursor: nil,
        # Filter to episodic layers whose episodic key starts with this prefix (e.g.
        # "customer/" matches "customer/42" and "customer/43"). Useful for namespaced
        # keys, similar to a redis key scan.
        episodic_key_prefix: nil,
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
        # Filter by layer type
        type: nil,
        request_options: {}
      )
      end

      # Deletes a memory layer from the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Memory layer ID. Accepts canonical memlyr\_… form or external_id:<value> form.
        id,
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
