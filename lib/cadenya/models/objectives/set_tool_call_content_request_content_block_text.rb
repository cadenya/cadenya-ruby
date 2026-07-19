# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class SetToolCallContentRequestContentBlockText < Cadenya::Internal::Type::BaseModel
        # @!attribute text
        #
        #   @return [Cadenya::Models::Objectives::SetToolCallContentRequestTextBlock]
        required :text, -> { Cadenya::Objectives::SetToolCallContentRequestTextBlock }

        # @!attribute type
        #
        #   @return [Symbol, Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockText::Type]
        required :type, enum: -> { Cadenya::Objectives::SetToolCallContentRequestContentBlockText::Type }

        # @!method initialize(text:, type:)
        #   @param text [Cadenya::Models::Objectives::SetToolCallContentRequestTextBlock]
        #   @param type [Symbol, Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockText::Type]

        # @see Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockText#type
        module Type
          extend Cadenya::Internal::Type::Enum

          TEXT = :text

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
