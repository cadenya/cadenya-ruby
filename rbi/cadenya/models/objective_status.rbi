# typed: strong

module Cadenya
  module Models
    class ObjectiveStatus < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveStatus, Cadenya::Internal::AnyHash)
        end

      sig { returns(Cadenya::ObjectiveStatus::State::TaggedSymbol) }
      attr_accessor :state

      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      sig do
        params(
          state: Cadenya::ObjectiveStatus::State::OrSymbol,
          message: String
        ).returns(T.attached_class)
      end
      def self.new(state:, message: nil)
      end

      sig do
        override.returns(
          {
            state: Cadenya::ObjectiveStatus::State::TaggedSymbol,
            message: String
          }
        )
      end
      def to_hash
      end

      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::ObjectiveStatus::State) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(
            :STATE_UNSPECIFIED,
            Cadenya::ObjectiveStatus::State::TaggedSymbol
          )
        STATE_PENDING =
          T.let(:STATE_PENDING, Cadenya::ObjectiveStatus::State::TaggedSymbol)
        STATE_RUNNING =
          T.let(:STATE_RUNNING, Cadenya::ObjectiveStatus::State::TaggedSymbol)
        STATE_COMPLETED =
          T.let(:STATE_COMPLETED, Cadenya::ObjectiveStatus::State::TaggedSymbol)
        STATE_FAILED =
          T.let(:STATE_FAILED, Cadenya::ObjectiveStatus::State::TaggedSymbol)
        STATE_CANCELLED =
          T.let(:STATE_CANCELLED, Cadenya::ObjectiveStatus::State::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::ObjectiveStatus::State::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
