# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Objectives#create
    class ObjectiveCreateParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String]
      required :workspace_id, String

      # @!attribute agent_id
      #
      #   @return [String]
      required :agent_id, String, api_name: :agentId

      # @!attribute system_prompt_data
      #   Arbitrary data rendered into the selected variation's system_prompt_template
      #   (liquid) to produce the objective's system prompt. If the agent has a
      #   system_prompt_data_schema, this must satisfy it.
      #
      #   @return [Hash{Symbol=>Object}]
      required :system_prompt_data,
               Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown],
               api_name: :systemPromptData

      # @!attribute episodic_memory
      #   Episodic is used to configure the episodic memory for the objective
      #
      #   @return [Cadenya::Models::ObjectiveCreateParams::EpisodicMemory, nil]
      optional :episodic_memory,
               -> { Cadenya::ObjectiveCreateParams::EpisodicMemory },
               api_name: :episodicMemory

      # @!attribute first_user_message
      #   Optional explicit first user message for the LLM chat history. When not set, the
      #   selected variation's first_user_message_template is rendered with
      #   first_user_message_data instead. If neither this field nor a
      #   first_user_message_template is present, the request is rejected with
      #   InvalidArgument.
      #
      #   @return [String, nil]
      optional :first_user_message, String, api_name: :firstUserMessage

      # @!attribute first_user_message_data
      #   Arbitrary data rendered into the selected variation's
      #   first_user_message_template (liquid) to produce the first user message. Separate
      #   from `system_prompt_data`, which renders the system prompt template.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :first_user_message_data,
               Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown],
               api_name: :firstUserMessageData

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

      # @!attribute metadata
      #   CreateOperationMetadata contains the user-provided fields for creating an
      #   operation. Read-only fields (id, account_id, workspace_id, created_at,
      #   profile_id) are excluded since they are set by the server.
      #
      #   @return [Cadenya::Models::CreateOperationMetadata, nil]
      optional :metadata, -> { Cadenya::CreateOperationMetadata }

      # @!attribute secrets
      #   Secrets that can be used in the headers for tool calls using the secret
      #   interpolation format.
      #
      #   @return [Array<Cadenya::Models::ObjectiveCreateParams::Secret>, nil]
      optional :secrets, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::ObjectiveCreateParams::Secret] }

      # @!attribute variation_id
      #   Optional explicit variation selection. Overrides the agent's
      #   variation_selection_mode.
      #
      #   @return [String, nil]
      optional :variation_id, String, api_name: :variationId

      # @!method initialize(workspace_id:, agent_id:, system_prompt_data:, episodic_memory: nil, first_user_message: nil, first_user_message_data: nil, memory_cascade: nil, metadata: nil, secrets: nil, variation_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveCreateParams} for more details.
      #
      #   @param workspace_id [String]
      #
      #   @param agent_id [String]
      #
      #   @param system_prompt_data [Hash{Symbol=>Object}] Arbitrary data rendered into the selected variation's system_prompt_template
      #
      #   @param episodic_memory [Cadenya::Models::ObjectiveCreateParams::EpisodicMemory] Episodic is used to configure the episodic memory for the objective
      #
      #   @param first_user_message [String] Optional explicit first user message for the LLM chat history. When not set,
      #
      #   @param first_user_message_data [Hash{Symbol=>Object}] Arbitrary data rendered into the selected variation's first_user_message_templat
      #
      #   @param memory_cascade [Array<Cadenya::Models::MemoryReference>] Memory layers/entries layered over the baseline cascade inherited
      #
      #   @param metadata [Cadenya::Models::CreateOperationMetadata] CreateOperationMetadata contains the user-provided fields for creating
      #
      #   @param secrets [Array<Cadenya::Models::ObjectiveCreateParams::Secret>] Secrets that can be used in the headers for tool calls using the secret interpol
      #
      #   @param variation_id [String] Optional explicit variation selection. Overrides the agent's variation_selection
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

      class EpisodicMemory < Cadenya::Internal::Type::BaseModel
        # @!attribute key
        #   The caller-supplied episodic key. Objectives created with the same key (for the
        #   same agent) share one episodic memory layer.
        #
        #   @return [String, nil]
        optional :key, String

        # @!method initialize(key: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ObjectiveCreateParams::EpisodicMemory} for more details.
        #
        #   Episodic is used to configure the episodic memory for the objective
        #
        #   @param key [String] The caller-supplied episodic key. Objectives created with the same key
      end

      class Secret < Cadenya::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute value
        #
        #   @return [String, nil]
        optional :value, String

        # @!method initialize(name: nil, value: nil)
        #   @param name [String]
        #   @param value [String]
      end
    end
  end
end
