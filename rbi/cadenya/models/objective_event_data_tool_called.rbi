# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataToolCalled < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveEventDataToolCalled,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(Cadenya::ToolCalled) }
      attr_reader :tool_called

      sig { params(tool_called: Cadenya::ToolCalled::OrHash).void }
      attr_writer :tool_called

      sig { returns(Cadenya::ObjectiveEventDataToolCalled::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          tool_called: Cadenya::ToolCalled::OrHash,
          type: Cadenya::ObjectiveEventDataToolCalled::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(tool_called:, type:)
      end

      sig do
        override.returns(
          {
            tool_called: Cadenya::ToolCalled,
            type: Cadenya::ObjectiveEventDataToolCalled::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ObjectiveEventDataToolCalled::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TOOL_CALLED =
          T.let(
            :toolCalled,
            Cadenya::ObjectiveEventDataToolCalled::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ObjectiveEventDataToolCalled::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
