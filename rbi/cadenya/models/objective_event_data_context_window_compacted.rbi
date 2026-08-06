# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataContextWindowCompacted < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveEventDataContextWindowCompacted,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(Cadenya::ContextWindowCompacted) }
      attr_reader :context_window_compacted

      sig do
        params(
          context_window_compacted: Cadenya::ContextWindowCompacted::OrHash
        ).void
      end
      attr_writer :context_window_compacted

      sig do
        returns(
          Cadenya::ObjectiveEventDataContextWindowCompacted::Type::TaggedSymbol
        )
      end
      attr_accessor :type

      sig do
        params(
          context_window_compacted: Cadenya::ContextWindowCompacted::OrHash,
          type:
            Cadenya::ObjectiveEventDataContextWindowCompacted::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(context_window_compacted:, type:)
      end

      sig do
        override.returns(
          {
            context_window_compacted: Cadenya::ContextWindowCompacted,
            type:
              Cadenya::ObjectiveEventDataContextWindowCompacted::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Cadenya::ObjectiveEventDataContextWindowCompacted::Type
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CONTEXT_WINDOW_COMPACTED =
          T.let(
            :contextWindowCompacted,
            Cadenya::ObjectiveEventDataContextWindowCompacted::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Cadenya::ObjectiveEventDataContextWindowCompacted::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
