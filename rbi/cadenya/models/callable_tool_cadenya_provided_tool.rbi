# typed: strong

module Cadenya
  module Models
    class CallableToolCadenyaProvidedTool < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::CallableToolCadenyaProvidedTool,
            Cadenya::Internal::AnyHash
          )
        end

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_reader :cadenya_provided_tool

      sig do
        params(cadenya_provided_tool: Cadenya::ResourceMetadata::OrHash).void
      end
      attr_writer :cadenya_provided_tool

      sig do
        returns(Cadenya::CallableToolCadenyaProvidedTool::Type::TaggedSymbol)
      end
      attr_accessor :type

      sig do
        params(
          cadenya_provided_tool: Cadenya::ResourceMetadata::OrHash,
          type: Cadenya::CallableToolCadenyaProvidedTool::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        cadenya_provided_tool:,
        type:
      )
      end

      sig do
        override.returns(
          {
            cadenya_provided_tool: Cadenya::ResourceMetadata,
            type: Cadenya::CallableToolCadenyaProvidedTool::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::CallableToolCadenyaProvidedTool::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CADENYA_PROVIDED_TOOL =
          T.let(
            :cadenyaProvidedTool,
            Cadenya::CallableToolCadenyaProvidedTool::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Cadenya::CallableToolCadenyaProvidedTool::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
