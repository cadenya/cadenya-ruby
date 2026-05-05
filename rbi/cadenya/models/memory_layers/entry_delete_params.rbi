# typed: strong

module Cadenya
  module Models
    module MemoryLayers
      class EntryDeleteParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::MemoryLayers::EntryDeleteParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        sig { returns(String) }
        attr_accessor :memory_layer_id

        sig { returns(String) }
        attr_accessor :id

        sig do
          params(
            workspace_id: String,
            memory_layer_id: String,
            id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(workspace_id:, memory_layer_id:, id:, request_options: {})
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              memory_layer_id: String,
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
