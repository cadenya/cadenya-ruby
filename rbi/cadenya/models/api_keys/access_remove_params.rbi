# typed: strong

module Cadenya
  module Models
    module APIKeys
      class AccessRemoveParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::APIKeys::AccessRemoveParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :workspace_id

        sig do
          params(
            id: String,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(id:, workspace_id:, request_options: {})
        end

        sig do
          override.returns(
            {
              id: String,
              workspace_id: String,
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
