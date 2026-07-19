# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataUserMessage < Cadenya::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataUserMessage::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataUserMessage::Type }

      # @!attribute user_message
      #
      #   @return [Cadenya::Models::UserMessage]
      required :user_message, -> { Cadenya::UserMessage }, api_name: :userMessage

      # @!method initialize(type:, user_message:)
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataUserMessage::Type]
      #   @param user_message [Cadenya::Models::UserMessage]

      # @see Cadenya::Models::ObjectiveEventDataUserMessage#type
      module Type
        extend Cadenya::Internal::Type::Enum

        USER_MESSAGE = :userMessage

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
