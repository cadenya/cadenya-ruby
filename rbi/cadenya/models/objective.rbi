# typed: strong

module Cadenya
  module Models
    class Objective < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::Objective, Cadenya::Internal::AnyHash) }

      # The initial message sent to the agent. This becomes the first user message in
      # the LLM chat history.
      sig { returns(String) }
      attr_accessor :initial_message

      # Metadata for ephemeral operations and activities (e.g., objectives, executions,
      # runs)
      sig { returns(Cadenya::OperationMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::OperationMetadata::OrHash).void }
      attr_writer :metadata

      # Memory layers/entries to push onto this objective's memory stack on top of the
      # baseline stack inherited from the selected variation.
      #
      # Array order is push order: the first element sits lower in the objective's
      # contribution to the stack; the LAST element ends up on top of the effective
      # stack. Entries pinned via memory_entry_id behave as single-entry layers at their
      # position.
      #
      # System-managed layers (e.g., episodic) cannot be referenced here; they attach
      # themselves automatically based on episodic_key.
      #
      # Stack size cap: the TOTAL effective stack (variation's memory layers
      #
      # - this field) must not exceed 10 entries. A request that would produce an
      #   effective stack larger than 10 is rejected with InvalidArgument.
      sig { returns(T.nilable(T::Array[Cadenya::MemoryReference])) }
      attr_reader :memory_stack

      sig do
        params(memory_stack: T::Array[Cadenya::MemoryReference::OrHash]).void
      end
      attr_writer :memory_stack

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

      # Arbitrary data for the objective
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :data

      sig { params(data: T::Hash[Symbol, T.anything]).void }
      attr_writer :data

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

      # Optional human-readable detail about the current state (e.g. a failure reason).
      sig { returns(T.nilable(String)) }
      attr_reader :state_message

      sig { params(state_message: String).void }
      attr_writer :state_message

      # Objective is the data for an objective. It contains the snapshotted fields for
      # the selected agent and variation. Secrets are returned only with their names,
      # and the output definition is copied from the agent's configuration.
      sig do
        params(
          config_snapshot: Cadenya::ObjectiveConfigSnapshot::OrHash,
          initial_message: String,
          metadata: Cadenya::OperationMetadata::OrHash,
          state: Cadenya::Objective::State::OrSymbol,
          system_prompt: String,
          data: T::Hash[Symbol, T.anything],
          info: Cadenya::ObjectiveInfo::OrHash,
          memory_stack: T::Array[Cadenya::MemoryReference::OrHash],
          output: T::Hash[Symbol, T.anything],
          parent_objective_id: String,
          secrets: T::Array[Cadenya::ObjectiveSecret::OrHash],
          state_message: String
        ).returns(T.attached_class)
      end
      def self.new(
        # ObjectiveConfigSnapshot is the point-in-time snapshot of the agent, variation,
        # and (when applicable) schedule that an objective was started with.
        config_snapshot:,
        # The initial message sent to the agent. This becomes the first user message in
        # the LLM chat history.
        initial_message:,
        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        metadata:,
        # The current lifecycle state of the objective.
        state:,
        # system_prompt is read-only, derived from the selected variation's prompt
        system_prompt:,
        # Arbitrary data for the objective
        data: nil,
        # ObjectiveInfo provides read-only aggregated statistics about an objective's
        # execution
        info: nil,
        # Memory layers/entries to push onto this objective's memory stack on top of the
        # baseline stack inherited from the selected variation.
        #
        # Array order is push order: the first element sits lower in the objective's
        # contribution to the stack; the LAST element ends up on top of the effective
        # stack. Entries pinned via memory_entry_id behave as single-entry layers at their
        # position.
        #
        # System-managed layers (e.g., episodic) cannot be referenced here; they attach
        # themselves automatically based on episodic_key.
        #
        # Stack size cap: the TOTAL effective stack (variation's memory layers
        #
        # - this field) must not exceed 10 entries. A request that would produce an
        #   effective stack larger than 10 is rejected with InvalidArgument.
        memory_stack: nil,
        # The output of the objective, populated when the objective completes. Will match
        # the schema of output_json_schema or output_json_inferred. This will only be set
        # if the state of the objective is set to STATE_FINALIZED
        output: nil,
        # A parent objective means the objective was spawned off using a separate agent to
        # complete an objective
        parent_objective_id: nil,
        # Secrets that can be used in the headers for tool calls using the secret
        # interpolation format.
        secrets: nil,
        # Optional human-readable detail about the current state (e.g. a failure reason).
        state_message: nil
      )
      end

      sig do
        override.returns(
          {
            config_snapshot: Cadenya::ObjectiveConfigSnapshot,
            initial_message: String,
            metadata: Cadenya::OperationMetadata,
            state: Cadenya::Objective::State::TaggedSymbol,
            system_prompt: String,
            data: T::Hash[Symbol, T.anything],
            info: Cadenya::ObjectiveInfo,
            memory_stack: T::Array[Cadenya::MemoryReference],
            output: T::Hash[Symbol, T.anything],
            parent_objective_id: String,
            secrets: T::Array[Cadenya::ObjectiveSecret],
            state_message: String
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

        sig do
          override.returns(T::Array[Cadenya::Objective::State::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
