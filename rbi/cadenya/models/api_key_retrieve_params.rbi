# typed: strong

module Cadenya
  module Models
    class APIKeyRetrieveParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::APIKeyRetrieveParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig do
        params(
          id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(id:, request_options: {})
      end

      sig do
        override.returns(
          { id: String, request_options: Cadenya::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
