# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Objectives#create
    class Objective < Cadenya::Internal::Type::BaseModel
      # @!attribute first_user_message
      #   The first user message in the LLM chat history, either provided explicitly at
      #   creation or rendered from the variation's first_user_message_template.
      #
      #   @return [String]
      required :first_user_message, String, api_name: :firstUserMessage

      # @!attribute metadata
      #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #   runs)
      #
      #   @return [Cadenya::Models::OperationMetadata]
      required :metadata, -> { Cadenya::OperationMetadata }

      # @!attribute episodic_memory
      #   Episodic is used to configure the episodic memory for the objective
      #
      #   @return [Cadenya::Models::Objective::EpisodicMemory, nil]
      optional :episodic_memory, -> { Cadenya::Objective::EpisodicMemory }, api_name: :episodicMemory

      # @!attribute memory_cascade
      #   Memory layers/entries layered over the baseline cascade inherited from the
      #   selected variation — element-level rules over inherited styles, in CSS terms.
      #
      #   Array order is resolution order: EARLIER elements are more specific and are
      #   consulted first. Entries pinned via memory_entry_id behave as single-entry
      #   layers at their position.
      #
      #   System-managed layers (e.g., episodic) cannot be referenced here; they attach
      #   themselves automatically based on the episodic key.
      #
      #   Size cap: the TOTAL effective cascade (this field + the variation's memory layer
      #   assignments) must not exceed 10 entries. A request that would produce a larger
      #   cascade is rejected with InvalidArgument.
      #
      #   @return [Array<Cadenya::Models::MemoryReference>, nil]
      optional :memory_cascade,
               -> { Cadenya::Internal::Type::ArrayOf[Cadenya::MemoryReference] },
               api_name: :memoryCascade

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

        # @!attribute first_user_message_data
        #   Arbitrary data rendered into the variation's first_user_message_template
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :first_user_message_data,
                 Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown],
                 api_name: :firstUserMessageData

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

        # @!attribute system_prompt_data
        #   Arbitrary data rendered into the variation's system_prompt_template
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :system_prompt_data,
                 Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown],
                 api_name: :systemPromptData
      end

      # @!method initialize(config_snapshot:, first_user_message:, metadata:, state:, system_prompt:, episodic_memory: nil, first_user_message_data: nil, info: nil, memory_cascade: nil, output: nil, parent_objective_id: nil, secrets: nil, state_message: nil, system_prompt_data: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::Objective} for more details.
      #
      #   Objective is the data for an objective. It contains the snapshotted fields for
      #   the selected agent and variation. Secrets are returned only with their names,
      #   and the output definition is copied from the agent's configuration.
      #
      #   @param config_snapshot [Cadenya::Models::ObjectiveConfigSnapshot] ObjectiveConfigSnapshot is the point-in-time snapshot of the agent, variation, a
      #
      #   @param first_user_message [String] The first user message in the LLM chat history, either provided explicitly at
      #
      #   @param metadata [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #
      #   @param state [Symbol, Cadenya::Models::Objective::State] The current lifecycle state of the objective.
      #
      #   @param system_prompt [String] system_prompt is read-only, derived from the selected variation's prompt
      #
      #   @param episodic_memory [Cadenya::Models::Objective::EpisodicMemory] Episodic is used to configure the episodic memory for the objective
      #
      #   @param first_user_message_data [Hash{Symbol=>Object}] Arbitrary data rendered into the variation's first_user_message_template
      #
      #   @param info [Cadenya::Models::ObjectiveInfo] ObjectiveInfo provides read-only aggregated statistics about an objective's exec
      #
      #   @param memory_cascade [Array<Cadenya::Models::MemoryReference>] Memory layers/entries layered over the baseline cascade inherited
      #
      #   @param output [Hash{Symbol=>Object}] The output of the objective, populated when the objective completes. Will match
      #
      #   @param parent_objective_id [String] A parent objective means the objective was spawned off using a separate agent to
      #
      #   @param secrets [Array<Cadenya::Models::ObjectiveSecret>] Secrets that can be used in the headers for tool calls using the secret interpol
      #
      #   @param state_message [String] Optional human-readable detail about the current state (e.g. a failure reason).
      #
      #   @param system_prompt_data [Hash{Symbol=>Object}] Arbitrary data rendered into the variation's system_prompt_template

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
        STATE_TIMED_OUT = :STATE_TIMED_OUT

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Cadenya::Models::Objective#episodic_memory
      class EpisodicMemory < Cadenya::Internal::Type::BaseModel
        # @!attribute key
        #   The caller-supplied episodic key. Objectives created with the same key (for the
        #   same agent) share one episodic memory layer.
        #
        #   @return [String]
        required :key, String

        response_only do
          # @!attribute memory_layer_id
          #   The episodic memory layer resolved (created or reused) for this objective's key.
          #   Populated by the system at objective creation.
          #
          #   @return [String, nil]
          optional :memory_layer_id, String, api_name: :memoryLayerId
        end

        # @!method initialize(key:, memory_layer_id: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Objective::EpisodicMemory} for more details.
        #
        #   Episodic is used to configure the episodic memory for the objective
        #
        #   @param key [String] The caller-supplied episodic key. Objectives created with the same key
        #
        #   @param memory_layer_id [String] The episodic memory layer resolved (created or reused) for this
      end
    end
  end
end
