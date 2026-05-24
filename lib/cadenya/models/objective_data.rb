# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveData < Cadenya::Internal::Type::BaseModel
      # @!attribute data
      #   Represents a dynamically typed value which can be either null, a number, a
      #   string, a boolean, a recursive struct value, or a list of values.
      #
      #   @return [Object, nil]
      optional :data, Cadenya::Internal::Type::Unknown

      # @!attribute initial_message
      #   The initial message sent to the agent. This becomes the first user message in
      #   the LLM chat history.
      #
      #   @return [String, nil]
      optional :initial_message, String, api_name: :initialMessage

      # @!attribute memory_stack
      #   Memory layers/entries to push onto this objective's memory stack on top of the
      #   baseline stack inherited from the selected variation.
      #
      #   Array order is push order: the first element sits lower in the objective's
      #   contribution to the stack; the LAST element ends up on top of the effective
      #   stack. Entries pinned via memory_entry_id behave as single-entry layers at their
      #   position.
      #
      #   System-managed layers (e.g., episodic) cannot be referenced here; they attach
      #   themselves automatically based on episodic_key.
      #
      #   Stack size cap: the TOTAL effective stack (variation's memory layers
      #
      #   - this field) must not exceed 10 entries. A request that would produce an
      #     effective stack larger than 10 is rejected with InvalidArgument.
      #
      #   @return [Array<Cadenya::Models::MemoryReference>, nil]
      optional :memory_stack,
               -> { Cadenya::Internal::Type::ArrayOf[Cadenya::MemoryReference] },
               api_name: :memoryStack

      # @!attribute secrets
      #   Secrets that can be used in the headers for tool calls using the secret
      #   interpolation format.
      #
      #   @return [Array<Cadenya::Models::ObjectiveDataSecret>, nil]
      optional :secrets, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::ObjectiveDataSecret] }

      response_only do
        # @!attribute agent
        #   Agent resource
        #
        #   @return [Cadenya::Models::Agent, nil]
        optional :agent, -> { Cadenya::Agent }

        # @!attribute output
        #   The output of the objective, populated when the objective completes. Will match
        #   the schema of output_json_schema or output_json_inferred.
        #
        #   @return [Object, nil]
        optional :output, Cadenya::Internal::Type::Unknown

        # @!attribute parent_objective_id
        #   A parent objective means the objective was spawned off using a separate agent to
        #   complete an objective
        #
        #   @return [String, nil]
        optional :parent_objective_id, String, api_name: :parentObjectiveId

        # @!attribute source_schedule_id
        #   ID of the AgentSchedule that produced this objective, when applicable. Populated
        #   when the objective is created from a schedule fire; empty when the objective was
        #   created via CreateObjective directly.
        #
        #   @return [String, nil]
        optional :source_schedule_id, String, api_name: :sourceScheduleId

        # @!attribute system_prompt
        #   system_prompt is read-only, derived from the selected variation's prompt
        #
        #   @return [String, nil]
        optional :system_prompt, String, api_name: :systemPrompt

        # @!attribute variation
        #   AgentVariation resource
        #
        #   @return [Cadenya::Models::Agents::AgentVariation, nil]
        optional :variation, -> { Cadenya::Agents::AgentVariation }
      end

      # @!method initialize(agent: nil, data: nil, initial_message: nil, memory_stack: nil, output: nil, parent_objective_id: nil, secrets: nil, source_schedule_id: nil, system_prompt: nil, variation: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveData} for more details.
      #
      #   @param agent [Cadenya::Models::Agent] Agent resource
      #
      #   @param data [Object] Represents a dynamically typed value which can be either null, a number, a strin
      #
      #   @param initial_message [String] The initial message sent to the agent. This becomes the first user message in th
      #
      #   @param memory_stack [Array<Cadenya::Models::MemoryReference>] Memory layers/entries to push onto this objective's memory stack on
      #
      #   @param output [Object] The output of the objective, populated when the objective completes. Will match
      #
      #   @param parent_objective_id [String] A parent objective means the objective was spawned off using a separate agent to
      #
      #   @param secrets [Array<Cadenya::Models::ObjectiveDataSecret>] Secrets that can be used in the headers for tool calls using the secret interpol
      #
      #   @param source_schedule_id [String] ID of the AgentSchedule that produced this objective, when applicable.
      #
      #   @param system_prompt [String] system_prompt is read-only, derived from the selected variation's prompt
      #
      #   @param variation [Cadenya::Models::Agents::AgentVariation] AgentVariation resource
    end
  end
end
