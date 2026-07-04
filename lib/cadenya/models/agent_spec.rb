# frozen_string_literal: true

module Cadenya
  module Models
    class AgentSpec < Cadenya::Internal::Type::BaseModel
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

      # @!attribute enable_episodic_memory
      #   Enable episodic memory for objectives created for this agent. When true,
      #   objective creation requires an episodic_memory key and the system finds or
      #   creates a memory layer for that (agent, key) pair, letting the agent store and
      #   retrieve memories across objectives that share the key. Memory is agent-level so
      #   all variations of the agent share the same layers.
      #
      #   @return [Boolean, nil]
      optional :enable_episodic_memory, Cadenya::Internal::Type::Boolean, api_name: :enableEpisodicMemory

      # @!attribute episodic_memory_ttl
      #   How long episodic memories should be retained. Each new objective slides the
      #   layer's expiry forward by this duration, and stored entries expire this long
      #   after they are written. If not set, episodic memories are retained indefinitely.
      #
      #   @return [Integer, nil]
      optional :episodic_memory_ttl, Integer, api_name: :episodicMemoryTtl

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

      # @!attribute system_prompt_data_schema
      #   SystemPromptDataSchema enforces the shape of system_prompt_data when objectives
      #   are created. This is valuable when using liquid formatting in agent variation
      #   system prompt templates. The schema is also used when the agent is attached as a
      #   sub-agent, as it becomes the tool's input parameter schema. If omitted, the
      #   sub-agent schema will be loaded with a simple "prompt" free text string as its
      #   schema.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :system_prompt_data_schema,
               Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown],
               api_name: :systemPromptDataSchema

      # @!attribute webhook_events_url
      #   The URL that Cadenya will send events for any objective assigned to the agent.
      #
      #   @return [String, nil]
      optional :webhook_events_url, String, api_name: :webhookEventsUrl

      # @!method initialize(variation_selection_mode:, description: nil, enable_episodic_memory: nil, episodic_memory_ttl: nil, output_definition: nil, system_prompt_data_schema: nil, webhook_events_url: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AgentSpec} for more details.
      #
      #   Agent specification (user-provided configuration)
      #
      #   @param variation_selection_mode [Symbol, Cadenya::Models::AgentSpec::VariationSelectionMode] Controls how variations are automatically selected when creating objectives
      #
      #   @param description [String] Description of the agent's purpose
      #
      #   @param enable_episodic_memory [Boolean] Enable episodic memory for objectives created for this agent.
      #
      #   @param episodic_memory_ttl [Integer] How long episodic memories should be retained.
      #
      #   @param output_definition [Hash{Symbol=>Object}] Optional output definition for objectives created for this agent.
      #
      #   @param system_prompt_data_schema [Hash{Symbol=>Object}] SystemPromptDataSchema enforces the shape of system_prompt_data when objectives
      #
      #   @param webhook_events_url [String] The URL that Cadenya will send events for any objective assigned to the agent.

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
