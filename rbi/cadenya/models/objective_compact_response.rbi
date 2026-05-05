# typed: strong

module Cadenya
  module Models
    class ObjectiveCompactResponse < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::Models::ObjectiveCompactResponse,
            Cadenya::Internal::AnyHash
          )
        end

      # The new context window created by the compaction
      sig { returns(T.nilable(Cadenya::ObjectiveContextWindowData)) }
      attr_reader :context_window

      sig do
        params(context_window: Cadenya::ObjectiveContextWindowData::OrHash).void
      end
      attr_writer :context_window

      # Compact objective response
      sig do
        params(
          context_window: Cadenya::ObjectiveContextWindowData::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The new context window created by the compaction
        context_window: nil
      )
      end

      sig do
        override.returns(
          { context_window: Cadenya::ObjectiveContextWindowData }
        )
      end
      def to_hash
      end
    end
  end
end
