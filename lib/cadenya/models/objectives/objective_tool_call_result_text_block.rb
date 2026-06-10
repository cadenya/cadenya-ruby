# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class ObjectiveToolCallResultTextBlock < Cadenya::Internal::Type::BaseModel
        response_only do
          # @!attribute text
          #
          #   @return [String]
          required :text, String
        end

        # @!method initialize(text:)
        #   @param text [String]
      end
    end

    ObjectiveToolCallResultTextBlock = Objectives::ObjectiveToolCallResultTextBlock
  end
end
