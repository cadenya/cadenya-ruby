# typed: strong

module Cadenya
  module Models
    module Agents
      class AddAgentVariationAssignmentRequestSubAgentID < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::AddAgentVariationAssignmentRequestSubAgentID,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :sub_agent_id

        sig do
          returns(
            Cadenya::Agents::AddAgentVariationAssignmentRequestSubAgentID::Type::OrSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            sub_agent_id: String,
            type:
              Cadenya::Agents::AddAgentVariationAssignmentRequestSubAgentID::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(sub_agent_id:, type:)
        end

        sig do
          override.returns(
            {
              sub_agent_id: String,
              type:
                Cadenya::Agents::AddAgentVariationAssignmentRequestSubAgentID::Type::OrSymbol,
              agent_id: String,
              variation_id: String,
              workspace_id: String
            }
          )
        end
        def to_hash
        end

        module Type
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Cadenya::Agents::AddAgentVariationAssignmentRequestSubAgentID::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUB_AGENT_ID =
            T.let(
              :subAgentId,
              Cadenya::Agents::AddAgentVariationAssignmentRequestSubAgentID::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Agents::AddAgentVariationAssignmentRequestSubAgentID::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
