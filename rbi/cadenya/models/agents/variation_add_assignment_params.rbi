# typed: strong

module Cadenya
  module Models
    module Agents
      class VariationAddAssignmentParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::VariationAddAssignmentParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { params(workspace_id: String).void }
        attr_writer :workspace_id

        sig { returns(String) }
        attr_accessor :agent_id

        sig { returns(String) }
        attr_accessor :variation_id

        # Attach a single tool, tool set, or sub-agent to a variation. Exactly one of the
        # target fields must be set; the assignment kind is inferred from the populated
        # field.
        sig do
          returns(
            T.any(
              Cadenya::Agents::AddAgentVariationAssignmentRequestToolID,
              Cadenya::Agents::AddAgentVariationAssignmentRequestToolSetID,
              Cadenya::Agents::AddAgentVariationAssignmentRequestSubAgentID
            )
          )
        end
        attr_accessor :body

        sig do
          params(
            agent_id: String,
            variation_id: String,
            body:
              T.any(
                Cadenya::Agents::AddAgentVariationAssignmentRequestToolID::OrHash,
                Cadenya::Agents::AddAgentVariationAssignmentRequestToolSetID::OrHash,
                Cadenya::Agents::AddAgentVariationAssignmentRequestSubAgentID::OrHash
              ),
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          agent_id:,
          variation_id:,
          # Attach a single tool, tool set, or sub-agent to a variation. Exactly one of the
          # target fields must be set; the assignment kind is inferred from the populated
          # field.
          body:,
          workspace_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              agent_id: String,
              variation_id: String,
              body:
                T.any(
                  Cadenya::Agents::AddAgentVariationAssignmentRequestToolID,
                  Cadenya::Agents::AddAgentVariationAssignmentRequestToolSetID,
                  Cadenya::Agents::AddAgentVariationAssignmentRequestSubAgentID
                ),
              request_options: Cadenya::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Attach a single tool, tool set, or sub-agent to a variation. Exactly one of the
        # target fields must be set; the assignment kind is inferred from the populated
        # field.
        module Body
          extend Cadenya::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Cadenya::Agents::AddAgentVariationAssignmentRequestToolID,
                Cadenya::Agents::AddAgentVariationAssignmentRequestToolSetID,
                Cadenya::Agents::AddAgentVariationAssignmentRequestSubAgentID
              )
            end

          sig do
            override.returns(
              T::Array[
                Cadenya::Agents::VariationAddAssignmentParams::Body::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
