# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class AgentVariationSpec < Cadenya::Internal::Type::BaseModel
        # @!attribute compaction_config
        #   CompactionConfig defines how context window compaction behaves for objectives
        #   using this variation.
        #
        #   @return [Cadenya::Models::Agents::AgentVariationSpecCompactionConfig, nil]
        optional :compaction_config,
                 -> { Cadenya::Agents::AgentVariationSpecCompactionConfig },
                 api_name: :compactionConfig

        # @!attribute constraints
        #   Execution constraints
        #
        #   @return [Cadenya::Models::Agents::AgentVariationSpecConstraints, nil]
        optional :constraints, -> { Cadenya::Agents::AgentVariationSpecConstraints }

        # @!attribute description
        #   Human-readable description of what this variation does or when it should be used
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute model_config
        #   ModelConfig defines the model configuration for a variation
        #
        #   @return [Cadenya::Models::Agents::AgentVariationSpecModelConfig, nil]
        optional :model_config, -> { Cadenya::Agents::AgentVariationSpecModelConfig }, api_name: :modelConfig

        # @!attribute progressive_discovery
        #   ProgressiveDiscovery is used to indicate that the agent should automatically
        #   discover tools that are not explicitly assigned to it. Max tools is the maximum
        #   number of tools that can be discovered per search. Hints are optional hints for
        #   tool search. These are used in conjunction with the context-aware tool search
        #   and can help select the best tools for the task.
        #
        #   @return [Cadenya::Models::Agents::AgentVariationSpecProgressiveDiscovery, nil]
        optional :progressive_discovery,
                 -> { Cadenya::Agents::AgentVariationSpecProgressiveDiscovery },
                 api_name: :progressiveDiscovery

        # @!attribute system_prompt_template
        #   Liquid template for the system prompt of objectives using this variation.
        #   Rendered with CreateObjectiveRequest.data into Objective.system_prompt.
        #
        #   @return [String, nil]
        optional :system_prompt_template, String, api_name: :systemPromptTemplate

        # @!attribute user_message_template
        #   Liquid template for the initial user message of objectives using this variation.
        #   Rendered with CreateObjectiveRequest.user_data and becomes the first user
        #   message in the LLM chat history. CreateObjectiveRequest.initial_message, when
        #   set, overrides the rendered result. If neither this template nor initial_message
        #   is present, objective creation is rejected with InvalidArgument.
        #
        #   @return [String, nil]
        optional :user_message_template, String, api_name: :userMessageTemplate

        # @!attribute weight
        #   Weight for weighted random selection (>= 0). P(v) = v.weight / sum(all_weights).
        #   Only used when the agent's variation_selection_mode is WEIGHTED. A weight of 0
        #   means never auto-selected, but can still be chosen explicitly via variation_id
        #   on CreateObjectiveRequest.
        #
        #   @return [Integer, nil]
        optional :weight, Integer

        # @!method initialize(compaction_config: nil, constraints: nil, description: nil, model_config: nil, progressive_discovery: nil, system_prompt_template: nil, user_message_template: nil, weight: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::AgentVariationSpec} for more details.
        #
        #   AgentVariationSpec defines the operational configuration for a variation
        #
        #   @param compaction_config [Cadenya::Models::Agents::AgentVariationSpecCompactionConfig] CompactionConfig defines how context window compaction behaves for objectives us
        #
        #   @param constraints [Cadenya::Models::Agents::AgentVariationSpecConstraints] Execution constraints
        #
        #   @param description [String] Human-readable description of what this variation does or when it should be used
        #
        #   @param model_config [Cadenya::Models::Agents::AgentVariationSpecModelConfig] ModelConfig defines the model configuration for a variation
        #
        #   @param progressive_discovery [Cadenya::Models::Agents::AgentVariationSpecProgressiveDiscovery] ProgressiveDiscovery is used to indicate that the agent should automatically dis
        #
        #   @param system_prompt_template [String] Liquid template for the system prompt of objectives using this variation.
        #
        #   @param user_message_template [String] Liquid template for the initial user message of objectives using this variation.
        #
        #   @param weight [Integer] Weight for weighted random selection (>= 0). P(v) = v.weight / sum(all_weights).
      end
    end

    AgentVariationSpec = Agents::AgentVariationSpec
  end
end
