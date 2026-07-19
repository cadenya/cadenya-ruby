# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataUserMessage < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveEventDataUserMessage,
            Cadenya::Internal::AnyHash
          )
        end

      sig do
        returns(Cadenya::ObjectiveEventDataUserMessage::Type::TaggedSymbol)
      end
      attr_accessor :type

      sig { returns(Cadenya::UserMessage) }
      attr_reader :user_message

      sig { params(user_message: Cadenya::UserMessage::OrHash).void }
      attr_writer :user_message

      sig do
        params(
          type: Cadenya::ObjectiveEventDataUserMessage::Type::OrSymbol,
          user_message: Cadenya::UserMessage::OrHash
        ).returns(T.attached_class)
      end
      def self.new(type:, user_message:)
      end

      sig do
        override.returns(
          {
            type: Cadenya::ObjectiveEventDataUserMessage::Type::TaggedSymbol,
            user_message: Cadenya::UserMessage
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ObjectiveEventDataUserMessage::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        USER_MESSAGE =
          T.let(
            :userMessage,
            Cadenya::ObjectiveEventDataUserMessage::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ObjectiveEventDataUserMessage::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
