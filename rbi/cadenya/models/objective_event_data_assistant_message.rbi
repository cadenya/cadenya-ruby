# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataAssistantMessage < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveEventDataAssistantMessage,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(Cadenya::AssistantMessage) }
      attr_reader :assistant_message

      sig { params(assistant_message: Cadenya::AssistantMessage::OrHash).void }
      attr_writer :assistant_message

      sig do
        returns(Cadenya::ObjectiveEventDataAssistantMessage::Type::TaggedSymbol)
      end
      attr_accessor :type

      sig do
        params(
          assistant_message: Cadenya::AssistantMessage::OrHash,
          type: Cadenya::ObjectiveEventDataAssistantMessage::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(assistant_message:, type:)
      end

      sig do
        override.returns(
          {
            assistant_message: Cadenya::AssistantMessage,
            type:
              Cadenya::ObjectiveEventDataAssistantMessage::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ObjectiveEventDataAssistantMessage::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ASSISTANT_MESSAGE =
          T.let(
            :assistantMessage,
            Cadenya::ObjectiveEventDataAssistantMessage::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Cadenya::ObjectiveEventDataAssistantMessage::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
