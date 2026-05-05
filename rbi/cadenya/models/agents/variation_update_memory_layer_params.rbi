# typed: strong

module Cadenya
  module Models
    module Agents
      class VariationUpdateMemoryLayerParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::VariationUpdateMemoryLayerParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        sig { returns(String) }
        attr_accessor :agent_id

        sig { returns(String) }
        attr_accessor :variation_id

        sig { returns(String) }
        attr_accessor :id

        # New position. Only field currently updatable on an assignment.
        sig { returns(T.nilable(Integer)) }
        attr_reader :position

        sig { params(position: Integer).void }
        attr_writer :position

        sig do
          params(
            workspace_id: String,
            agent_id: String,
            variation_id: String,
            id: String,
            position: Integer,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          workspace_id:,
          agent_id:,
          variation_id:,
          id:,
          # New position. Only field currently updatable on an assignment.
          position: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              agent_id: String,
              variation_id: String,
              id: String,
              position: Integer,
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
