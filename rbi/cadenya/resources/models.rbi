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
          cursor: String,
          include_info: T::Boolean,
          is_assigned: T::Boolean,
          labels: String,
          limit: Integer,
          prefix: String,
          query: String,
          sort_order: String,
          state: Cadenya::ModelListParams::State::OrSymbol,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::Model])
      end
      def list(
        # Workspace ID.
        workspace_id,
        # Filter to models provisioned on a specific AI provider key. Accepts the key's id
        # or an "external_id:"-prefixed slug.
        ai_provider_key_id: nil,
        # Pagination cursor from previous response
        cursor: nil,
        # When true, populate each item's info (e.g. the AI provider), at the cost of
        # extra lookups.
        include_info: nil,
        # Filter models to only ones assigned to an active agent variation/agent. Draft
        # agents count as assigned; archived agents do not. Assignment does not imply
        # recent traffic — see ModelInfo.last_used_at for that.
        is_assigned: nil,
        # Filters by metadata labels. Comma-separated key=value pairs, e.g.
        # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        # semantics).
        labels: nil,
        # Maximum number of results to return
        limit: nil,
        # Filter by name prefix
        prefix: nil,
        # Free-form search query
        query: nil,
        # Sort order for results (asc or desc by creation time)
        sort_order: nil,
        # Filter by model state
        state: nil,
        request_options: {}
      )
      end

      # Transitions a model to STATE_DISABLED. Fails while agent variations are still
      # provisioned on the model; use :swapModelOnVariations to move them first.
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Model)
      end
      def disable(
        # Model ID
        id,
        # Workspace ID.
        workspace_id:,
        request_options: {}
      )
      end

      # Transitions a model to STATE_ENABLED, making it available for agent variations
      # in the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Model)
      end
      def enable(
        # Model ID
        id,
        # Workspace ID.
        workspace_id:,
        request_options: {}
      )
      end

      # Reassigns agent variations from one model to another in bulk. Runs
      # asynchronously and returns immediately.
      sig do
        params(
          workspace_id: String,
          model_swaps: T::Array[Cadenya::ModelSwapParams::ModelSwap::OrHash],
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def swap(
        # Workspace ID.
        workspace_id,
        # The swaps to perform.
        model_swaps: nil,
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
