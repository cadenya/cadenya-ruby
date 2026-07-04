# typed: strong

module Cadenya
  module Models
    AgentVariationSpec = Agents::AgentVariationSpec

    module Agents
      class AgentVariationSpec < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::AgentVariationSpec,
              Cadenya::Internal::AnyHash
            )
          end

        # CompactionConfig defines how context window compaction behaves for objectives
        # using this variation.
        sig do
          returns(
            T.nilable(Cadenya::Agents::AgentVariationSpecCompactionConfig)
          )
        end
        attr_reader :compaction_config

        sig do
          params(
            compaction_config:
              Cadenya::Agents::AgentVariationSpecCompactionConfig::OrHash
          ).void
        end
        attr_writer :compaction_config

        # Execution constraints
        sig do
          returns(T.nilable(Cadenya::Agents::AgentVariationSpecConstraints))
        end
        attr_reader :constraints

        sig do
          params(
            constraints: Cadenya::Agents::AgentVariationSpecConstraints::OrHash
          ).void
        end
        attr_writer :constraints

        # Human-readable description of what this variation does or when it should be used
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # Liquid template for the first user message of objectives using this variation.
        # Rendered with CreateObjectiveRequest.first_user_message_data into
        # Objective.first_user_message, the first user message in the LLM chat history.
        # CreateObjectiveRequest.first_user_message, when set, overrides the rendered
        # result. If neither this template nor first_user_message is present, objective
        # creation is rejected with InvalidArgument.
        sig { returns(T.nilable(String)) }
        attr_reader :first_user_message_template

        sig { params(first_user_message_template: String).void }
        attr_writer :first_user_message_template

        # ModelConfig defines the model configuration for a variation
        sig do
          returns(T.nilable(Cadenya::Agents::AgentVariationSpecModelConfig))
        end
        attr_reader :model_config

        sig do
          params(
            model_config: Cadenya::Agents::AgentVariationSpecModelConfig::OrHash
          ).void
        end
        attr_writer :model_config

        # ProgressiveDiscovery is used to indicate that the agent should automatically
        # discover tools that are not explicitly assigned to it. Max tools is the maximum
        # number of tools that can be discovered per search. Hints are optional hints for
        # tool search. These are used in conjunction with the context-aware tool search
        # and can help select the best tools for the task.
        sig do
          returns(
            T.nilable(Cadenya::Agents::AgentVariationSpecProgressiveDiscovery)
          )
        end
        attr_reader :progressive_discovery

        sig do
          params(
            progressive_discovery:
              Cadenya::Agents::AgentVariationSpecProgressiveDiscovery::OrHash
          ).void
        end
        attr_writer :progressive_discovery

        # Liquid template for the system prompt of objectives using this variation.
        # Rendered with CreateObjectiveRequest.system_prompt_data into
        # Objective.system_prompt.
        sig { returns(T.nilable(String)) }
        attr_reader :system_prompt_template

        sig { params(system_prompt_template: String).void }
        attr_writer :system_prompt_template

        # Weight for weighted random selection (>= 0). P(v) = v.weight / sum(all_weights).
        # Only used when the agent's variation_selection_mode is WEIGHTED. A weight of 0
        # means never auto-selected, but can still be chosen explicitly via variation_id
        # on CreateObjectiveRequest.
        sig { returns(T.nilable(Integer)) }
        attr_reader :weight

        sig { params(weight: Integer).void }
        attr_writer :weight

        # AgentVariationSpec defines the operational configuration for a variation
        sig do
          params(
            compaction_config:
              Cadenya::Agents::AgentVariationSpecCompactionConfig::OrHash,
            constraints: Cadenya::Agents::AgentVariationSpecConstraints::OrHash,
            description: String,
            first_user_message_template: String,
            model_config:
              Cadenya::Agents::AgentVariationSpecModelConfig::OrHash,
            progressive_discovery:
              Cadenya::Agents::AgentVariationSpecProgressiveDiscovery::OrHash,
            system_prompt_template: String,
            weight: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # CompactionConfig defines how context window compaction behaves for objectives
          # using this variation.
          compaction_config: nil,
          # Execution constraints
          constraints: nil,
          # Human-readable description of what this variation does or when it should be used
          description: nil,
          # Liquid template for the first user message of objectives using this variation.
          # Rendered with CreateObjectiveRequest.first_user_message_data into
          # Objective.first_user_message, the first user message in the LLM chat history.
          # CreateObjectiveRequest.first_user_message, when set, overrides the rendered
          # result. If neither this template nor first_user_message is present, objective
          # creation is rejected with InvalidArgument.
          first_user_message_template: nil,
          # ModelConfig defines the model configuration for a variation
          model_config: nil,
          # ProgressiveDiscovery is used to indicate that the agent should automatically
          # discover tools that are not explicitly assigned to it. Max tools is the maximum
          # number of tools that can be discovered per search. Hints are optional hints for
          # tool search. These are used in conjunction with the context-aware tool search
          # and can help select the best tools for the task.
          progressive_discovery: nil,
          # Liquid template for the system prompt of objectives using this variation.
          # Rendered with CreateObjectiveRequest.system_prompt_data into
          # Objective.system_prompt.
          system_prompt_template: nil,
          # Weight for weighted random selection (>= 0). P(v) = v.weight / sum(all_weights).
          # Only used when the agent's variation_selection_mode is WEIGHTED. A weight of 0
          # means never auto-selected, but can still be chosen explicitly via variation_id
          # on CreateObjectiveRequest.
          weight: nil
        )
        end

        sig do
          override.returns(
            {
              compaction_config:
                Cadenya::Agents::AgentVariationSpecCompactionConfig,
              constraints: Cadenya::Agents::AgentVariationSpecConstraints,
              description: String,
              first_user_message_template: String,
              model_config: Cadenya::Agents::AgentVariationSpecModelConfig,
              progressive_discovery:
                Cadenya::Agents::AgentVariationSpecProgressiveDiscovery,
              system_prompt_template: String,
              weight: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
