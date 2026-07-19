# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataAssistantMessage < Cadenya::Internal::Type::BaseModel
      # @!attribute assistant_message
      #
      #   @return [Cadenya::Models::AssistantMessage]
      required :assistant_message, -> { Cadenya::AssistantMessage }, api_name: :assistantMessage

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataAssistantMessage::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataAssistantMessage::Type }

      # @!method initialize(assistant_message:, type:)
      #   @param assistant_message [Cadenya::Models::AssistantMessage]
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataAssistantMessage::Type]

      # @see Cadenya::Models::ObjectiveEventDataAssistantMessage#type
      module Type
        extend Cadenya::Internal::Type::Enum

        ASSISTANT_MESSAGE = :assistantMessage

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
