# typed: strong

module Cadenya
  module Models
    class ObjectiveInfo < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveInfo, Cadenya::Internal::AnyHash)
        end

      # A profile identifies a user or non-human principal (such as an API key) at the
      # account level. Profiles are account-scoped and can be granted access to multiple
      # workspaces.
      sig { returns(Cadenya::Profile) }
      attr_reader :created_by

      sig { params(created_by: Cadenya::Profile::OrHash).void }
      attr_writer :created_by

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_reader :agent

      sig { params(agent: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :agent

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_reader :agent_variation

      sig { params(agent_variation: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :agent_variation

      # ID of the objective's current (most recent) context window. Hydrated on demand;
      # empty when the objective has not yet produced a context window.
      sig { returns(String) }
      attr_accessor :current_context_window_id

      # The effective memory cascade at objective creation time: the episodic layer
      # (when present), then Objective.memory_cascade, then the variation's baseline
      # layers by ascending position. Order is resolution order — index 0 is the most
      # specific and is consulted first; the first layer containing a key wins. Returned
      # on reads so clients can see exactly what the objective resolves against without
      # re-joining variation state.
      sig { returns(T::Array[Cadenya::MemoryReference]) }
      attr_accessor :effective_memory_cascade

      # Total number of context windows that this objective has generated
      sig { returns(Integer) }
      attr_accessor :total_context_windows

      # Total number of events generated during this objective's execution
      sig { returns(Integer) }
      attr_accessor :total_events

      # Total input tokens consumed across all LLM completions across all context
      # windows
      sig { returns(Integer) }
      attr_accessor :total_input_tokens

      sig { returns(Integer) }
      attr_accessor :total_iterations

      # Total output tokens generated across all LLM completions across all context
      # windows
      sig { returns(Integer) }
      attr_accessor :total_output_tokens

      # Total number of tool calls made during execution
      sig { returns(Integer) }
      attr_accessor :total_tool_calls

      # SubjectReference is the read-only echo of a resource's subject association,
      # carrying both Cadenya's canonical id and the customer's own key.
      sig { returns(T.nilable(Cadenya::SubjectReference)) }
      attr_reader :subject

      sig { params(subject: Cadenya::SubjectReference::OrHash).void }
      attr_writer :subject

      # TenantReference is the read-only echo of a resource's tenant association,
      # carrying both Cadenya's canonical id and the customer's own key.
      sig { returns(T.nilable(Cadenya::TenantReference)) }
      attr_reader :tenant

      sig { params(tenant: Cadenya::TenantReference::OrHash).void }
      attr_writer :tenant

      # ObjectiveInfo provides read-only aggregated statistics about an objective's
      # execution
      sig do
        params(
          agent: Cadenya::ResourceMetadata::OrHash,
          agent_variation: Cadenya::ResourceMetadata::OrHash,
          created_by: Cadenya::Profile::OrHash,
          current_context_window_id: String,
          effective_memory_cascade: T::Array[Cadenya::MemoryReference::OrHash],
          total_context_windows: Integer,
          total_events: Integer,
          total_input_tokens: Integer,
          total_iterations: Integer,
          total_output_tokens: Integer,
          total_tool_calls: Integer,
          subject: Cadenya::SubjectReference::OrHash,
          tenant: Cadenya::TenantReference::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        agent:,
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        agent_variation:,
        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        created_by:,
        # ID of the objective's current (most recent) context window. Hydrated on demand;
        # empty when the objective has not yet produced a context window.
        current_context_window_id:,
        # The effective memory cascade at objective creation time: the episodic layer
        # (when present), then Objective.memory_cascade, then the variation's baseline
        # layers by ascending position. Order is resolution order — index 0 is the most
        # specific and is consulted first; the first layer containing a key wins. Returned
        # on reads so clients can see exactly what the objective resolves against without
        # re-joining variation state.
        effective_memory_cascade:,
        # Total number of context windows that this objective has generated
        total_context_windows:,
        # Total number of events generated during this objective's execution
        total_events:,
        # Total input tokens consumed across all LLM completions across all context
        # windows
        total_input_tokens:,
        total_iterations:,
        # Total output tokens generated across all LLM completions across all context
        # windows
        total_output_tokens:,
        # Total number of tool calls made during execution
        total_tool_calls:,
        # SubjectReference is the read-only echo of a resource's subject association,
        # carrying both Cadenya's canonical id and the customer's own key.
        subject: nil,
        # TenantReference is the read-only echo of a resource's tenant association,
        # carrying both Cadenya's canonical id and the customer's own key.
        tenant: nil
      )
      end

      sig do
        override.returns(
          {
            agent: Cadenya::ResourceMetadata,
            agent_variation: Cadenya::ResourceMetadata,
            created_by: Cadenya::Profile,
            current_context_window_id: String,
            effective_memory_cascade: T::Array[Cadenya::MemoryReference],
            total_context_windows: Integer,
            total_events: Integer,
            total_input_tokens: Integer,
            total_iterations: Integer,
            total_output_tokens: Integer,
            total_tool_calls: Integer,
            subject: Cadenya::SubjectReference,
            tenant: Cadenya::TenantReference
          }
        )
      end
      def to_hash
      end
    end
  end
end
