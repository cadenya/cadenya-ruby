# frozen_string_literal: true

module Cadenya
  module Models
    class AgentSpec < Cadenya::Internal::Type::BaseModel
      # @!attribute status
      #   Status of the agent
      #
      #   @return [Symbol, Cadenya::Models::AgentSpec::Status]
      required :status, enum: -> { Cadenya::AgentSpec::Status }

      # @!attribute variation_selection_mode
      #   Controls how variations are automatically selected when creating objectives
      #   Defaults to RANDOM when unspecified
      #
      #   @return [Symbol, Cadenya::Models::AgentSpec::VariationSelectionMode]
      required :variation_selection_mode,
               enum: -> { Cadenya::AgentSpec::VariationSelectionMode },
               api_name: :variationSelectionMode

      # @!attribute description
      #   Description of the agent's purpose
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute input_data_schema
      #   InputDataSchema is used for enforcing a data input when objectives are created.
      #   This is valuable when using liquid formatting in agent variation prompts. Input
      #   data schema is also valuable when using an agent as a sub-agent, as the schema
      #   is used as the tool's input parameter schema. If omitted, the sub-agent schema
      #   will be loaded with a simple "prompt" free text string as its schema.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :input_data_schema,
               Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown],
               api_name: :inputDataSchema

      # @!attribute output_definition
      #   Optional output definition for objectives created for this agent. When provided,
      #   Cadenya will append a tool to that will be called by the LLM in use by the
      #   variant to extract information in the format provided here. Use this option when
      #   you want structured data to be created by your objectives.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :output_definition,
               Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown],
               api_name: :outputDefinition

      # @!attribute webhook_events_url
      #   The URL that Cadenya will send events for any objective assigned to the agent.
      #
      #   @return [String, nil]
      optional :webhook_events_url, String, api_name: :webhookEventsUrl

      # @!method initialize(status:, variation_selection_mode:, description: nil, input_data_schema: nil, output_definition: nil, webhook_events_url: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AgentSpec} for more details.
      #
      #   Agent specification (user-provided configuration)
      #
      #   @param status [Symbol, Cadenya::Models::AgentSpec::Status] Status of the agent
      #
      #   @param variation_selection_mode [Symbol, Cadenya::Models::AgentSpec::VariationSelectionMode] Controls how variations are automatically selected when creating objectives
      #
      #   @param description [String] Description of the agent's purpose
      #
      #   @param input_data_schema [Hash{Symbol=>Object}] InputDataSchema is used for enforcing a data input when objectives are created.
      #
      #   @param output_definition [Hash{Symbol=>Object}] Optional output definition for objectives created for this agent.
      #
      #   @param webhook_events_url [String] The URL that Cadenya will send events for any objective assigned to the agent.

      # Status of the agent
      #
      # @see Cadenya::Models::AgentSpec#status
      module Status
        extend Cadenya::Internal::Type::Enum

        AGENT_STATUS_UNSPECIFIED = :AGENT_STATUS_UNSPECIFIED
        AGENT_STATUS_DRAFT = :AGENT_STATUS_DRAFT
        AGENT_STATUS_PUBLISHED = :AGENT_STATUS_PUBLISHED
        AGENT_STATUS_ARCHIVED = :AGENT_STATUS_ARCHIVED

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Controls how variations are automatically selected when creating objectives
      # Defaults to RANDOM when unspecified
      #
      # @see Cadenya::Models::AgentSpec#variation_selection_mode
      module VariationSelectionMode
        extend Cadenya::Internal::Type::Enum

        VARIATION_SELECTION_MODE_UNSPECIFIED = :VARIATION_SELECTION_MODE_UNSPECIFIED
        VARIATION_SELECTION_MODE_RANDOM = :VARIATION_SELECTION_MODE_RANDOM
        VARIATION_SELECTION_MODE_WEIGHTED = :VARIATION_SELECTION_MODE_WEIGHTED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
