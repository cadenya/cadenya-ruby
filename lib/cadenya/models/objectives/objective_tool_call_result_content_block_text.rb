# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class ObjectiveToolCallResultContentBlockText < Cadenya::Internal::Type::BaseModel
        # @!attribute text
        #
        #   @return [Cadenya::Models::Objectives::ObjectiveToolCallResultTextBlock]
        required :text, -> { Cadenya::Objectives::ObjectiveToolCallResultTextBlock }

        # @!attribute type
        #
        #   @return [Symbol, Cadenya::Models::Objectives::ObjectiveToolCallResultContentBlockText::Type]
        required :type, enum: -> { Cadenya::Objectives::ObjectiveToolCallResultContentBlockText::Type }

        # @!method initialize(text:, type:)
        #   @param text [Cadenya::Models::Objectives::ObjectiveToolCallResultTextBlock]
        #   @param type [Symbol, Cadenya::Models::Objectives::ObjectiveToolCallResultContentBlockText::Type]

        # @see Cadenya::Models::Objectives::ObjectiveToolCallResultContentBlockText#type
        module Type
          extend Cadenya::Internal::Type::Enum

          TEXT = :text

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    ObjectiveToolCallResultContentBlockText = Objectives::ObjectiveToolCallResultContentBlockText
  end
end
