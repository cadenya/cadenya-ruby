# typed: strong

module Cadenya
  module Models
    class ToolSetAdapterMCPVariant < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetAdapterMCPVariant, Cadenya::Internal::AnyHash)
        end

      sig { returns(Cadenya::ToolSetAdapterMCP) }
      attr_reader :mcp

      sig { params(mcp: Cadenya::ToolSetAdapterMCP::OrHash).void }
      attr_writer :mcp

      sig { returns(Cadenya::ToolSetAdapterMCPVariant::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          mcp: Cadenya::ToolSetAdapterMCP::OrHash,
          type: Cadenya::ToolSetAdapterMCPVariant::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(mcp:, type:)
      end

      sig do
        override.returns(
          {
            mcp: Cadenya::ToolSetAdapterMCP,
            type: Cadenya::ToolSetAdapterMCPVariant::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ToolSetAdapterMCPVariant::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MCP = T.let(:mcp, Cadenya::ToolSetAdapterMCPVariant::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::ToolSetAdapterMCPVariant::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
