# typed: strong

module Cadenya
  module Models
    module Agents
      class AddAgentVariationAssignmentRequestToolID < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::AddAgentVariationAssignmentRequestToolID,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :tool_id

        sig do
          returns(
            Cadenya::Agents::AddAgentVariationAssignmentRequestToolID::Type::OrSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            tool_id: String,
            type:
              Cadenya::Agents::AddAgentVariationAssignmentRequestToolID::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(tool_id:, type:)
        end

        sig do
          override.returns(
            {
              tool_id: String,
              type:
                Cadenya::Agents::AddAgentVariationAssignmentRequestToolID::Type::OrSymbol,
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
                Cadenya::Agents::AddAgentVariationAssignmentRequestToolID::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TOOL_ID =
            T.let(
              :toolId,
              Cadenya::Agents::AddAgentVariationAssignmentRequestToolID::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Agents::AddAgentVariationAssignmentRequestToolID::Type::TaggedSymbol
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
