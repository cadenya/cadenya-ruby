# typed: strong

module Cadenya
  module Models
    class Objective < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::Objective, Cadenya::Internal::AnyHash) }

      # The first user message in the LLM chat history, either provided explicitly at
      # creation or rendered from the variation's first_user_message_template.
      sig { returns(String) }
      attr_accessor :first_user_message

      # Metadata for ephemeral operations and activities (e.g., objectives, executions,
      # runs)
      sig { returns(Cadenya::OperationMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::OperationMetadata::OrHash).void }
      attr_writer :metadata

      # Episodic is used to configure the episodic memory for the objective
      sig { returns(T.nilable(Cadenya::Objective::EpisodicMemory)) }
      attr_reader :episodic_memory

      sig do
        params(episodic_memory: Cadenya::Objective::EpisodicMemory::OrHash).void
      end
      attr_writer :episodic_memory

      # Memory layers/entries layered over the baseline cascade inherited from the
      # selected variation — element-level rules over inherited styles, in CSS terms.
      #
      # Array order is resolution order: EARLIER elements are more specific and are
      # consulted first. Entries pinned via memory_entry_id behave as single-entry
      # layers at their position.
      #
      # System-managed layers (e.g., episodic) cannot be referenced here; they attach
      # themselves automatically based on the episodic key.
      #
      # Size cap: the TOTAL effective cascade (this field + the variation's memory layer
      # assignments) must not exceed 10 entries. A request that would produce a larger
      # cascade is rejected with InvalidArgument.
      sig { returns(T.nilable(T::Array[Cadenya::MemoryReference])) }
      attr_reader :memory_cascade

      sig do
        params(memory_cascade: T::Array[Cadenya::MemoryReference::OrHash]).void
      end
      attr_writer :memory_cascade

      # Secrets that can be used in the headers for tool calls using the secret
      # interpolation format.
      sig { returns(T.nilable(T::Array[Cadenya::ObjectiveSecret])) }
      attr_reader :secrets

      sig { params(secrets: T::Array[Cadenya::ObjectiveSecret::OrHash]).void }
      attr_writer :secrets

      # ObjectiveConfigSnapshot is the point-in-time snapshot of the agent, variation,
      # and (when applicable) schedule that an objective was started with.
      sig { returns(Cadenya::ObjectiveConfigSnapshot) }
      attr_reader :config_snapshot

      sig do
        params(config_snapshot: Cadenya::ObjectiveConfigSnapshot::OrHash).void
      end
      attr_writer :config_snapshot

      # The current lifecycle state of the objective.
      sig { returns(Cadenya::Objective::State::TaggedSymbol) }
      attr_accessor :state

      # system_prompt is read-only, derived from the selected variation's prompt
      sig { returns(String) }
      attr_accessor :system_prompt

      # Arbitrary data rendered into the variation's first_user_message_template
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :first_user_message_data

      sig { params(first_user_message_data: T::Hash[Symbol, T.anything]).void }
      attr_writer :first_user_message_data

      # ObjectiveInfo provides read-only aggregated statistics about an objective's
      # execution
      sig { returns(T.nilable(Cadenya::ObjectiveInfo)) }
      attr_reader :info

      sig { params(info: Cadenya::ObjectiveInfo::OrHash).void }
      attr_writer :info

      # The output of the objective, populated when the objective completes. Will match
      # the schema of output_json_schema or output_json_inferred. This will only be set
      # if the state of the objective is set to STATE_FINALIZED
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :output

      sig { params(output: T::Hash[Symbol, T.anything]).void }
      attr_writer :output

      # A parent objective means the objective was spawned off using a separate agent to
      # complete an objective
      sig { returns(T.nilable(String)) }
      attr_reader :parent_objective_id

      sig { params(parent_objective_id: String).void }
      attr_writer :parent_objective_id

      # Parameters forced onto this objective's tool calls, as provided at creation. See
      # CreateObjectiveRequest.pinned_parameters for semantics.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :pinned_parameters

      sig { params(pinned_parameters: T::Hash[Symbol, String]).void }
      attr_writer :pinned_parameters

      # Optional human-readable detail about the current state (e.g. a failure reason).
      sig { returns(T.nilable(String)) }
      attr_reader :state_message

      sig { params(state_message: String).void }
      attr_writer :state_message

      # Arbitrary data rendered into the variation's system_prompt_template
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :system_prompt_data

      sig { params(system_prompt_data: T::Hash[Symbol, T.anything]).void }
      attr_writer :system_prompt_data

      # Objective is the data for an objective. It contains the snapshotted fields for
      # the selected agent and variation. Secrets are returned only with their names,
      # and the output definition is copied from the agent's configuration.
      sig do
        params(
          config_snapshot: Cadenya::ObjectiveConfigSnapshot::OrHash,
          first_user_message: String,
          metadata: Cadenya::OperationMetadata::OrHash,
          state: Cadenya::Objective::State::OrSymbol,
          system_prompt: String,
          episodic_memory: Cadenya::Objective::EpisodicMemory::OrHash,
          first_user_message_data: T::Hash[Symbol, T.anything],
          info: Cadenya::ObjectiveInfo::OrHash,
          memory_cascade: T::Array[Cadenya::MemoryReference::OrHash],
          output: T::Hash[Symbol, T.anything],
          parent_objective_id: String,
          pinned_parameters: T::Hash[Symbol, String],
          secrets: T::Array[Cadenya::ObjectiveSecret::OrHash],
          state_message: String,
          system_prompt_data: T::Hash[Symbol, T.anything]
        ).returns(T.attached_class)
      end
      def self.new(
        # ObjectiveConfigSnapshot is the point-in-time snapshot of the agent, variation,
        # and (when applicable) schedule that an objective was started with.
        config_snapshot:,
        # The first user message in the LLM chat history, either provided explicitly at
        # creation or rendered from the variation's first_user_message_template.
        first_user_message:,
        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        metadata:,
        # The current lifecycle state of the objective.
        state:,
        # system_prompt is read-only, derived from the selected variation's prompt
        system_prompt:,
        # Episodic is used to configure the episodic memory for the objective
        episodic_memory: nil,
        # Arbitrary data rendered into the variation's first_user_message_template
        first_user_message_data: nil,
        # ObjectiveInfo provides read-only aggregated statistics about an objective's
        # execution
        info: nil,
        # Memory layers/entries layered over the baseline cascade inherited from the
        # selected variation — element-level rules over inherited styles, in CSS terms.
        #
        # Array order is resolution order: EARLIER elements are more specific and are
        # consulted first. Entries pinned via memory_entry_id behave as single-entry
        # layers at their position.
        #
        # System-managed layers (e.g., episodic) cannot be referenced here; they attach
        # themselves automatically based on the episodic key.
        #
        # Size cap: the TOTAL effective cascade (this field + the variation's memory layer
        # assignments) must not exceed 10 entries. A request that would produce a larger
        # cascade is rejected with InvalidArgument.
        memory_cascade: nil,
        # The output of the objective, populated when the objective completes. Will match
        # the schema of output_json_schema or output_json_inferred. This will only be set
        # if the state of the objective is set to STATE_FINALIZED
        output: nil,
        # A parent objective means the objective was spawned off using a separate agent to
        # complete an objective
        parent_objective_id: nil,
        # Parameters forced onto this objective's tool calls, as provided at creation. See
        # CreateObjectiveRequest.pinned_parameters for semantics.
        pinned_parameters: nil,
        # Secrets that can be used in the headers for tool calls using the secret
        # interpolation format.
        secrets: nil,
        # Optional human-readable detail about the current state (e.g. a failure reason).
        state_message: nil,
        # Arbitrary data rendered into the variation's system_prompt_template
        system_prompt_data: nil
      )
      end

      sig do
        override.returns(
          {
            config_snapshot: Cadenya::ObjectiveConfigSnapshot,
            first_user_message: String,
            metadata: Cadenya::OperationMetadata,
            state: Cadenya::Objective::State::TaggedSymbol,
            system_prompt: String,
            episodic_memory: Cadenya::Objective::EpisodicMemory,
            first_user_message_data: T::Hash[Symbol, T.anything],
            info: Cadenya::ObjectiveInfo,
            memory_cascade: T::Array[Cadenya::MemoryReference],
            output: T::Hash[Symbol, T.anything],
            parent_objective_id: String,
            pinned_parameters: T::Hash[Symbol, String],
            secrets: T::Array[Cadenya::ObjectiveSecret],
            state_message: String,
            system_prompt_data: T::Hash[Symbol, T.anything]
          }
        )
      end
      def to_hash
      end

      # The current lifecycle state of the objective.
      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Cadenya::Objective::State) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(:STATE_UNSPECIFIED, Cadenya::Objective::State::TaggedSymbol)
        STATE_PENDING =
          T.let(:STATE_PENDING, Cadenya::Objective::State::TaggedSymbol)
        STATE_RUNNING =
          T.let(:STATE_RUNNING, Cadenya::Objective::State::TaggedSymbol)
        STATE_WAITING =
          T.let(:STATE_WAITING, Cadenya::Objective::State::TaggedSymbol)
        STATE_FAILED =
          T.let(:STATE_FAILED, Cadenya::Objective::State::TaggedSymbol)
        STATE_CANCELLED =
          T.let(:STATE_CANCELLED, Cadenya::Objective::State::TaggedSymbol)
        STATE_FINALIZED =
          T.let(:STATE_FINALIZED, Cadenya::Objective::State::TaggedSymbol)
        STATE_TIMED_OUT =
          T.let(:STATE_TIMED_OUT, Cadenya::Objective::State::TaggedSymbol)

        sig do
          override.returns(T::Array[Cadenya::Objective::State::TaggedSymbol])
        end
        def self.values
        end
      end

      class EpisodicMemory < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objective::EpisodicMemory,
              Cadenya::Internal::AnyHash
            )
          end

        # The caller-supplied episodic key. Objectives created with the same key (for the
        # same agent) share one episodic memory layer.
        sig { returns(String) }
        attr_accessor :key

        # The episodic memory layer resolved (created or reused) for this objective's key.
        # Populated by the system at objective creation.
        sig { returns(T.nilable(String)) }
        attr_reader :memory_layer_id

        sig { params(memory_layer_id: String).void }
        attr_writer :memory_layer_id

        # Episodic is used to configure the episodic memory for the objective
        sig do
          params(key: String, memory_layer_id: String).returns(T.attached_class)
        end
        def self.new(
          # The caller-supplied episodic key. Objectives created with the same key (for the
          # same agent) share one episodic memory layer.
          key:,
          # The episodic memory layer resolved (created or reused) for this objective's key.
          # Populated by the system at objective creation.
          memory_layer_id: nil
        )
        end

        sig { override.returns({ key: String, memory_layer_id: String }) }
        def to_hash
        end
      end
    end
  end
end
