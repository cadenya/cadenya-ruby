# typed: strong

module Cadenya
  module Models
    AgentVariation = Agents::AgentVariation

    module Agents
      class AgentVariation < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::Agents::AgentVariation, Cadenya::Internal::AnyHash)
          end

        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        sig { returns(Cadenya::ResourceMetadata) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::ResourceMetadata::OrHash).void }
        attr_writer :metadata

        # AgentVariationSpec defines the operational configuration for a variation
        sig { returns(Cadenya::Agents::AgentVariationSpec) }
        attr_reader :spec

        sig { params(spec: Cadenya::Agents::AgentVariationSpec::OrHash).void }
        attr_writer :spec

        # AgentVariationInfo provides read-only summary information about a variation
        sig { returns(T.nilable(Cadenya::Agents::AgentVariationInfo)) }
        attr_reader :info

        sig { params(info: Cadenya::Agents::AgentVariationInfo::OrHash).void }
        attr_writer :info

        # AgentVariation resource
        sig do
          params(
            metadata: Cadenya::ResourceMetadata::OrHash,
            spec: Cadenya::Agents::AgentVariationSpec::OrHash,
            info: Cadenya::Agents::AgentVariationInfo::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
          metadata:,
          # AgentVariationSpec defines the operational configuration for a variation
          spec:,
          # AgentVariationInfo provides read-only summary information about a variation
          info: nil
        )
        end

        sig do
          override.returns(
            {
              metadata: Cadenya::ResourceMetadata,
              spec: Cadenya::Agents::AgentVariationSpec,
              info: Cadenya::Agents::AgentVariationInfo
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
