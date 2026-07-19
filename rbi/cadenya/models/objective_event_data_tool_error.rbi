# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataToolError < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveEventDataToolError,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(Cadenya::ToolError) }
      attr_reader :tool_error

      sig { params(tool_error: Cadenya::ToolError::OrHash).void }
      attr_writer :tool_error

      sig { returns(Cadenya::ObjectiveEventDataToolError::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          tool_error: Cadenya::ToolError::OrHash,
          type: Cadenya::ObjectiveEventDataToolError::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(tool_error:, type:)
      end

      sig do
        override.returns(
          {
            tool_error: Cadenya::ToolError,
            type: Cadenya::ObjectiveEventDataToolError::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ObjectiveEventDataToolError::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TOOL_ERROR =
          T.let(
            :toolError,
            Cadenya::ObjectiveEventDataToolError::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ObjectiveEventDataToolError::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
