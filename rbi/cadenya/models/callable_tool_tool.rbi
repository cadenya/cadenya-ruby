# typed: strong

module Cadenya
  module Models
    class CallableToolTool < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::CallableToolTool, Cadenya::Internal::AnyHash)
        end

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_reader :tool

      sig { params(tool: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :tool

      sig { returns(Cadenya::CallableToolTool::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          tool: Cadenya::ResourceMetadata::OrHash,
          type: Cadenya::CallableToolTool::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        tool:,
        type:
      )
      end

      sig do
        override.returns(
          {
            tool: Cadenya::ResourceMetadata,
            type: Cadenya::CallableToolTool::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::CallableToolTool::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TOOL = T.let(:tool, Cadenya::CallableToolTool::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::CallableToolTool::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
