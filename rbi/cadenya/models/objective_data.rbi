# typed: strong

module Cadenya
  module Models
    class ObjectiveData < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveData, Cadenya::Internal::AnyHash)
        end

      # Represents a dynamically typed value which can be either null, a number, a
      # string, a boolean, a recursive struct value, or a list of values.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :data

      sig { params(data: T.anything).void }
      attr_writer :data

      # The initial message sent to the agent. This becomes the first user message in
      # the LLM chat history.
      sig { returns(T.nilable(String)) }
      attr_reader :initial_message

      sig { params(initial_message: String).void }
      attr_writer :initial_message

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
      sig { returns(T.nilable(T::Array[Cadenya::ObjectiveDataSecret])) }
      attr_reader :secrets

      sig do
        params(secrets: T::Array[Cadenya::ObjectiveDataSecret::OrHash]).void
      end
      attr_writer :secrets

      # Agent resource
      sig { returns(T.nilable(Cadenya::Agent)) }
      attr_reader :agent

      sig { params(agent: Cadenya::Agent::OrHash).void }
      attr_writer :agent

      # The output of the objective, populated when the objective completes. Will match
      # the schema of output_json_schema or output_json_inferred.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :output

      sig { params(output: T.anything).void }
      attr_writer :output

      # A parent objective means the objective was spawned off using a separate agent to
      # complete an objective
      sig { returns(T.nilable(String)) }
      attr_reader :parent_objective_id

      sig { params(parent_objective_id: String).void }
      attr_writer :parent_objective_id

      # ID of the AgentSchedule that produced this objective, when applicable. Populated
      # when the objective is created from a schedule fire; empty when the objective was
      # created via CreateObjective directly.
      sig { returns(T.nilable(String)) }
      attr_reader :source_schedule_id

      sig { params(source_schedule_id: String).void }
      attr_writer :source_schedule_id

      # system_prompt is read-only, derived from the selected variation's prompt
      sig { returns(T.nilable(String)) }
      attr_reader :system_prompt

      sig { params(system_prompt: String).void }
      attr_writer :system_prompt

      # AgentVariation resource
      sig { returns(T.nilable(Cadenya::Agents::AgentVariation)) }
      attr_reader :variation

      sig { params(variation: Cadenya::Agents::AgentVariation::OrHash).void }
      attr_writer :variation

      sig do
        params(
          agent: Cadenya::Agent::OrHash,
          data: T.anything,
          initial_message: String,
          memory_stack: T::Array[Cadenya::MemoryReference::OrHash],
          output: T.anything,
          parent_objective_id: String,
          secrets: T::Array[Cadenya::ObjectiveDataSecret::OrHash],
          source_schedule_id: String,
          system_prompt: String,
          variation: Cadenya::Agents::AgentVariation::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Agent resource
        agent: nil,
        # Represents a dynamically typed value which can be either null, a number, a
        # string, a boolean, a recursive struct value, or a list of values.
        data: nil,
        # The initial message sent to the agent. This becomes the first user message in
        # the LLM chat history.
        initial_message: nil,
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
        # the schema of output_json_schema or output_json_inferred.
        output: nil,
        # A parent objective means the objective was spawned off using a separate agent to
        # complete an objective
        parent_objective_id: nil,
        # Secrets that can be used in the headers for tool calls using the secret
        # interpolation format.
        secrets: nil,
        # ID of the AgentSchedule that produced this objective, when applicable. Populated
        # when the objective is created from a schedule fire; empty when the objective was
        # created via CreateObjective directly.
        source_schedule_id: nil,
        # system_prompt is read-only, derived from the selected variation's prompt
        system_prompt: nil,
        # AgentVariation resource
        variation: nil
      )
      end

      sig do
        override.returns(
          {
            agent: Cadenya::Agent,
            data: T.anything,
            initial_message: String,
            memory_stack: T::Array[Cadenya::MemoryReference],
            output: T.anything,
            parent_objective_id: String,
            secrets: T::Array[Cadenya::ObjectiveDataSecret],
            source_schedule_id: String,
            system_prompt: String,
            variation: Cadenya::Agents::AgentVariation
          }
        )
      end
      def to_hash
      end
    end
  end
end
