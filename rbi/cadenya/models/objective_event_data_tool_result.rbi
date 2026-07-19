# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataToolResult < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveEventDataToolResult,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(Cadenya::ToolResult) }
      attr_reader :tool_result

      sig { params(tool_result: Cadenya::ToolResult::OrHash).void }
      attr_writer :tool_result

      sig { returns(Cadenya::ObjectiveEventDataToolResult::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          tool_result: Cadenya::ToolResult::OrHash,
          type: Cadenya::ObjectiveEventDataToolResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(tool_result:, type:)
      end

      sig do
        override.returns(
          {
            tool_result: Cadenya::ToolResult,
            type: Cadenya::ObjectiveEventDataToolResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ObjectiveEventDataToolResult::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TOOL_RESULT =
          T.let(
            :toolResult,
            Cadenya::ObjectiveEventDataToolResult::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ObjectiveEventDataToolResult::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
