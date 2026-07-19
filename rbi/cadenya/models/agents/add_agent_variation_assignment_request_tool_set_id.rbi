# typed: strong

module Cadenya
  module Models
    module Agents
      class AddAgentVariationAssignmentRequestToolSetID < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::AddAgentVariationAssignmentRequestToolSetID,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :tool_set_id

        sig do
          returns(
            Cadenya::Agents::AddAgentVariationAssignmentRequestToolSetID::Type::OrSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            tool_set_id: String,
            type:
              Cadenya::Agents::AddAgentVariationAssignmentRequestToolSetID::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(tool_set_id:, type:)
        end

        sig do
          override.returns(
            {
              tool_set_id: String,
              type:
                Cadenya::Agents::AddAgentVariationAssignmentRequestToolSetID::Type::OrSymbol,
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
                Cadenya::Agents::AddAgentVariationAssignmentRequestToolSetID::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TOOL_SET_ID =
            T.let(
              :toolSetId,
              Cadenya::Agents::AddAgentVariationAssignmentRequestToolSetID::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Agents::AddAgentVariationAssignmentRequestToolSetID::Type::TaggedSymbol
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
