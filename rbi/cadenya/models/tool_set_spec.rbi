# typed: strong

module Cadenya
  module Models
    class ToolSetSpec < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::ToolSetSpec, Cadenya::Internal::AnyHash) }

      sig do
        returns(
          T.any(
            Cadenya::ToolSetAdapterMCPVariant,
            Cadenya::ToolSetAdapterHTTPVariant,
            Cadenya::ToolSetAdapterOpenAPIVariant,
            Cadenya::ToolSetAdapterBareVariant
          )
        )
      end
      attr_accessor :adapter

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig do
        params(
          adapter:
            T.any(
              Cadenya::ToolSetAdapterMCPVariant::OrHash,
              Cadenya::ToolSetAdapterHTTPVariant::OrHash,
              Cadenya::ToolSetAdapterOpenAPIVariant::OrHash,
              Cadenya::ToolSetAdapterBareVariant::OrHash
            ),
          description: String
        ).returns(T.attached_class)
      end
      def self.new(adapter:, description: nil)
      end

      sig do
        override.returns(
          {
            adapter:
              T.any(
                Cadenya::ToolSetAdapterMCPVariant,
                Cadenya::ToolSetAdapterHTTPVariant,
                Cadenya::ToolSetAdapterOpenAPIVariant,
                Cadenya::ToolSetAdapterBareVariant
              ),
            description: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
