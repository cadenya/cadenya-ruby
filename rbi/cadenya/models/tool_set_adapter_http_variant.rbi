# typed: strong

module Cadenya
  module Models
    class ToolSetAdapterHTTPVariant < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetAdapterHTTPVariant, Cadenya::Internal::AnyHash)
        end

      sig { returns(Cadenya::ToolSetAdapterHTTP) }
      attr_reader :http

      sig { params(http: Cadenya::ToolSetAdapterHTTP::OrHash).void }
      attr_writer :http

      sig { returns(Cadenya::ToolSetAdapterHTTPVariant::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          http: Cadenya::ToolSetAdapterHTTP::OrHash,
          type: Cadenya::ToolSetAdapterHTTPVariant::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(http:, type:)
      end

      sig do
        override.returns(
          {
            http: Cadenya::ToolSetAdapterHTTP,
            type: Cadenya::ToolSetAdapterHTTPVariant::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ToolSetAdapterHTTPVariant::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        HTTP =
          T.let(:http, Cadenya::ToolSetAdapterHTTPVariant::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::ToolSetAdapterHTTPVariant::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
