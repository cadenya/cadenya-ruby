# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class SetToolCallContentRequestTextBlock < Cadenya::Internal::Type::BaseModel
        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!method initialize(text:)
        #   @param text [String]
      end
    end
  end
end
