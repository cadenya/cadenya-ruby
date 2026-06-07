# typed: strong

module Cadenya
  module Resources
    # Manage LLM models available to a workspace. Models represent provider and family
    # pairs (e.g., "anthropic/claude-sonnet-4.6"). Workspaces are seeded with the
    # supported models and you can enable or disable each one.
    class Models
      # Retrieves a model by ID from the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Model)
      end
      def retrieve(
        # Model ID
        id,
        # Workspace ID.
        workspace_id:,
        request_options: {}
      )
      end

      # Lists all models in the workspace
      sig do
        params(
          workspace_id: String,
          ai_provider_key_id: String,
          bundle_key: String,
          cursor: String,
          include_info: T::Boolean,
          limit: Integer,
          prefix: String,
          query: String,
          sort_order: String,
          status: Cadenya::ModelListParams::Status::OrSymbol,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::Model])
      end
      def list(
        # Workspace ID.
        workspace_id,
        # Filter to models provisioned on a specific AI provider key. Accepts the key's id
        # or an "external_id:"-prefixed slug.
        ai_provider_key_id: nil,
        # Filter by bundle_key — return only resources owned by this bundle.
        bundle_key: nil,
        # Pagination cursor from previous response
        cursor: nil,
        # When true, populate each item's info (e.g. the AI provider), at the cost of
        # extra lookups.
        include_info: nil,
        # Maximum number of results to return
        limit: nil,
        # Filter by name prefix
        prefix: nil,
        # Free-form search query
        query: nil,
        # Sort order for results (asc or desc by creation time)
        sort_order: nil,
        # Filter by model status
        status: nil,
        request_options: {}
      )
      end

      # Enables or disables a model in the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          status: Cadenya::ModelSetStatusParams::Status::OrSymbol,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Model)
      end
      def set_status(
        # Path param: Model ID
        id,
        # Path param: Workspace ID.
        workspace_id:,
        # Body param: The new status for the model
        status: nil,
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
