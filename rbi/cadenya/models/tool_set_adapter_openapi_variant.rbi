# typed: strong

module Cadenya
  module Models
    class ToolSetAdapterOpenAPIVariant < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ToolSetAdapterOpenAPIVariant,
            Cadenya::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.any(
            Cadenya::ToolSetAdapterOpenAPIURL,
            Cadenya::ToolSetAdapterOpenAPIUploadID
          )
        )
      end
      attr_accessor :openapi

      sig { returns(Cadenya::ToolSetAdapterOpenAPIVariant::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          openapi:
            T.any(
              Cadenya::ToolSetAdapterOpenAPIURL::OrHash,
              Cadenya::ToolSetAdapterOpenAPIUploadID::OrHash
            ),
          type: Cadenya::ToolSetAdapterOpenAPIVariant::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(openapi:, type:)
      end

      sig do
        override.returns(
          {
            openapi:
              T.any(
                Cadenya::ToolSetAdapterOpenAPIURL,
                Cadenya::ToolSetAdapterOpenAPIUploadID
              ),
            type: Cadenya::ToolSetAdapterOpenAPIVariant::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ToolSetAdapterOpenAPIVariant::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPENAPI =
          T.let(
            :openapi,
            Cadenya::ToolSetAdapterOpenAPIVariant::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ToolSetAdapterOpenAPIVariant::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
