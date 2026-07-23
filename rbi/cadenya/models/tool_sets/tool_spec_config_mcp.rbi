# typed: strong

module Cadenya
  module Models
    module ToolSets
      class ToolSpecConfigMCP < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ToolSets::ToolSpecConfigMCP,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(Cadenya::ToolSets::ConfigMCP) }
        attr_reader :mcp

        sig { params(mcp: Cadenya::ToolSets::ConfigMCP::OrHash).void }
        attr_writer :mcp

        sig { returns(Cadenya::ToolSets::ToolSpecConfigMCP::Type::OrSymbol) }
        attr_accessor :type

        sig do
          params(
            mcp: Cadenya::ToolSets::ConfigMCP::OrHash,
            type: Cadenya::ToolSets::ToolSpecConfigMCP::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(mcp:, type:)
        end

        sig do
          override.returns(
            {
              mcp: Cadenya::ToolSets::ConfigMCP,
              type: Cadenya::ToolSets::ToolSpecConfigMCP::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::ToolSets::ToolSpecConfigMCP::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MCP =
            T.let(
              :mcp,
              Cadenya::ToolSets::ToolSpecConfigMCP::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Cadenya::ToolSets::ToolSpecConfigMCP::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
