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

      # @!attribute data
      #   Arbitrary data for the objective. May be used in liquid templates for prompts
      #   configured on the agent variation
      #
      #   @return [Hash{Symbol=>Object}]
      required :data, Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]

      # @!attribute initial_message
      #   Optional override for the initial message sent to the agent. This becomes the
      #   first user message in the LLM chat history. When not set, the selected
      #   variation's user_message_template is rendered with user_data instead. If neither
      #   this field nor a user_message_template is present, the request is rejected with
      #   InvalidArgument.
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

      # @!attribute user_data
      #   Arbitrary data rendered into the selected variation's user_message_template
      #   (liquid) to produce the initial user message. Separate from `data`, which
      #   renders the system prompt template.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :user_data,
               Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown],
               api_name: :userData

      # @!attribute variation_id
      #   Optional explicit variation selection. Overrides the agent's
      #   variation_selection_mode.
      #
      #   @return [String, nil]
      optional :variation_id, String, api_name: :variationId

      # @!method initialize(workspace_id:, agent_id:, data:, initial_message: nil, memory_stack: nil, metadata: nil, secrets: nil, user_data: nil, variation_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveCreateParams} for more details.
      #
      #   @param workspace_id [String]
      #
      #   @param agent_id [String]
      #
      #   @param data [Hash{Symbol=>Object}] Arbitrary data for the objective. May be used in liquid templates for prompts co
      #
      #   @param initial_message [String] Optional override for the initial message sent to the agent. This becomes the fi
      #
      #   @param memory_stack [Array<Cadenya::Models::MemoryReference>] Memory layers/entries to push onto this objective's memory stack on
      #
      #   @param metadata [Cadenya::Models::CreateOperationMetadata] CreateOperationMetadata contains the user-provided fields for creating
      #
      #   @param secrets [Array<Cadenya::Models::ObjectiveCreateParams::Secret>] Secrets that can be used in the headers for tool calls using the secret interpol
      #
      #   @param user_data [Hash{Symbol=>Object}] Arbitrary data rendered into the selected variation's user_message_template
      #
      #   @param variation_id [String] Optional explicit variation selection. Overrides the agent's variation_selection
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

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
