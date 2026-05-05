# typed: strong

module Cadenya
  module Models
    module APIKeys
      class AccessAddParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(Cadenya::APIKeys::AccessAddParams, Cadenya::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :id

        # The workspace to grant access to.
        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { params(workspace_id: String).void }
        attr_writer :workspace_id

        sig do
          params(
            id: String,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # The workspace to grant access to.
          workspace_id: nil,
          request_options: {}
        )
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
