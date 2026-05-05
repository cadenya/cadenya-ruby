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

        # Enable episodic memory for objectives using this variation. When true, the
        # system automatically creates a document namespace for each objective using the
        # objective's episodic_key as the external_id, allowing the agent to store and
        # retrieve documents specific to that episode.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :enable_episodic_memory

        sig { params(enable_episodic_memory: T::Boolean).void }
        attr_writer :enable_episodic_memory

        # How long episodic memories should be retained. After this duration, episodic
        # document namespaces can be automatically cleaned up. If not set, episodic
        # memories are retained indefinitely.
        sig { returns(T.nilable(Integer)) }
        attr_reader :episodic_memory_ttl

        sig { params(episodic_memory_ttl: Integer).void }
        attr_writer :episodic_memory_ttl

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

        # The system prompt for this variation
        sig { returns(T.nilable(String)) }
        attr_reader :prompt

        sig { params(prompt: String).void }
        attr_writer :prompt

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
            enable_episodic_memory: T::Boolean,
            episodic_memory_ttl: Integer,
            model_config:
              Cadenya::Agents::AgentVariationSpecModelConfig::OrHash,
            progressive_discovery:
              Cadenya::Agents::AgentVariationSpecProgressiveDiscovery::OrHash,
            prompt: String,
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
          # Enable episodic memory for objectives using this variation. When true, the
          # system automatically creates a document namespace for each objective using the
          # objective's episodic_key as the external_id, allowing the agent to store and
          # retrieve documents specific to that episode.
          enable_episodic_memory: nil,
          # How long episodic memories should be retained. After this duration, episodic
          # document namespaces can be automatically cleaned up. If not set, episodic
          # memories are retained indefinitely.
          episodic_memory_ttl: nil,
          # ModelConfig defines the model configuration for a variation
          model_config: nil,
          # ProgressiveDiscovery is used to indicate that the agent should automatically
          # discover tools that are not explicitly assigned to it. Max tools is the maximum
          # number of tools that can be discovered per search. Hints are optional hints for
          # tool search. These are used in conjunction with the context-aware tool search
          # and can help select the best tools for the task.
          progressive_discovery: nil,
          # The system prompt for this variation
          prompt: nil,
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
              enable_episodic_memory: T::Boolean,
              episodic_memory_ttl: Integer,
              model_config: Cadenya::Agents::AgentVariationSpecModelConfig,
              progressive_discovery:
                Cadenya::Agents::AgentVariationSpecProgressiveDiscovery,
              prompt: String,
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
