# typed: strong

module Cadenya
  module Models
    module Agents
      class VariationRetrieveParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::VariationRetrieveParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        sig { returns(String) }
        attr_accessor :agent_id

        sig { returns(String) }
        attr_accessor :id

        sig do
          params(
            workspace_id: String,
            agent_id: String,
            id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(workspace_id:, agent_id:, id:, request_options: {})
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              agent_id: String,
              id: String,
              request_options: Cadenya::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
