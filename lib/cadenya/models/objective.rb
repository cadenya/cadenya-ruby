# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Objectives#create
    class Objective < Cadenya::Internal::Type::BaseModel
      # @!attribute initial_message
      #   The initial message sent to the agent. This becomes the first user message in
      #   the LLM chat history.
      #
      #   @return [String]
      required :initial_message, String, api_name: :initialMessage

      # @!attribute metadata
      #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #   runs)
      #
      #   @return [Cadenya::Models::OperationMetadata]
      required :metadata, -> { Cadenya::OperationMetadata }

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
      #   @return [Array<Cadenya::Models::ObjectiveSecret>, nil]
      optional :secrets, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::ObjectiveSecret] }

      response_only do
        # @!attribute config_snapshot
        #   ObjectiveConfigSnapshot is the point-in-time snapshot of the agent, variation,
        #   and (when applicable) schedule that an objective was started with.
        #
        #   @return [Cadenya::Models::ObjectiveConfigSnapshot]
        required :config_snapshot, -> { Cadenya::ObjectiveConfigSnapshot }, api_name: :configSnapshot

        # @!attribute state
        #   The current lifecycle state of the objective.
        #
        #   @return [Symbol, Cadenya::Models::Objective::State]
        required :state, enum: -> { Cadenya::Objective::State }

        # @!attribute system_prompt
        #   system_prompt is read-only, derived from the selected variation's prompt
        #
        #   @return [String]
        required :system_prompt, String, api_name: :systemPrompt

        # @!attribute data
        #   Arbitrary data for the objective
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :data, Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]

        # @!attribute info
        #   ObjectiveInfo provides read-only aggregated statistics about an objective's
        #   execution
        #
        #   @return [Cadenya::Models::ObjectiveInfo, nil]
        optional :info, -> { Cadenya::ObjectiveInfo }

        # @!attribute output
        #   The output of the objective, populated when the objective completes. Will match
        #   the schema of output_json_schema or output_json_inferred. This will only be set
        #   if the state of the objective is set to STATE_FINALIZED
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :output, Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]

        # @!attribute parent_objective_id
        #   A parent objective means the objective was spawned off using a separate agent to
        #   complete an objective
        #
        #   @return [String, nil]
        optional :parent_objective_id, String, api_name: :parentObjectiveId

        # @!attribute state_message
        #   Optional human-readable detail about the current state (e.g. a failure reason).
        #
        #   @return [String, nil]
        optional :state_message, String, api_name: :stateMessage

        # @!attribute user_data
        #   Arbitrary data used to render the variation's user_message_template
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :user_data,
                 Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown],
                 api_name: :userData
      end

      # @!method initialize(config_snapshot:, initial_message:, metadata:, state:, system_prompt:, data: nil, info: nil, memory_stack: nil, output: nil, parent_objective_id: nil, secrets: nil, state_message: nil, user_data: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::Objective} for more details.
      #
      #   Objective is the data for an objective. It contains the snapshotted fields for
      #   the selected agent and variation. Secrets are returned only with their names,
      #   and the output definition is copied from the agent's configuration.
      #
      #   @param config_snapshot [Cadenya::Models::ObjectiveConfigSnapshot] ObjectiveConfigSnapshot is the point-in-time snapshot of the agent, variation, a
      #
      #   @param initial_message [String] The initial message sent to the agent. This becomes the first user message in th
      #
      #   @param metadata [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #
      #   @param state [Symbol, Cadenya::Models::Objective::State] The current lifecycle state of the objective.
      #
      #   @param system_prompt [String] system_prompt is read-only, derived from the selected variation's prompt
      #
      #   @param data [Hash{Symbol=>Object}] Arbitrary data for the objective
      #
      #   @param info [Cadenya::Models::ObjectiveInfo] ObjectiveInfo provides read-only aggregated statistics about an objective's exec
      #
      #   @param memory_stack [Array<Cadenya::Models::MemoryReference>] Memory layers/entries to push onto this objective's memory stack on
      #
      #   @param output [Hash{Symbol=>Object}] The output of the objective, populated when the objective completes. Will match
      #
      #   @param parent_objective_id [String] A parent objective means the objective was spawned off using a separate agent to
      #
      #   @param secrets [Array<Cadenya::Models::ObjectiveSecret>] Secrets that can be used in the headers for tool calls using the secret interpol
      #
      #   @param state_message [String] Optional human-readable detail about the current state (e.g. a failure reason).
      #
      #   @param user_data [Hash{Symbol=>Object}] Arbitrary data used to render the variation's user_message_template

      # The current lifecycle state of the objective.
      #
      # @see Cadenya::Models::Objective#state
      module State
        extend Cadenya::Internal::Type::Enum

        STATE_UNSPECIFIED = :STATE_UNSPECIFIED
        STATE_PENDING = :STATE_PENDING
        STATE_RUNNING = :STATE_RUNNING
        STATE_WAITING = :STATE_WAITING
        STATE_FAILED = :STATE_FAILED
        STATE_CANCELLED = :STATE_CANCELLED
        STATE_FINALIZED = :STATE_FINALIZED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
