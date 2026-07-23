# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class SetToolCallContentRequestContentBlockImage < Cadenya::Internal::Type::BaseModel
        # @!attribute image
        #
        #   @return [Cadenya::Models::Objectives::SetToolCallContentRequestImageBlock]
        required :image, -> { Cadenya::Objectives::SetToolCallContentRequestImageBlock }

        # @!attribute type
        #
        #   @return [Symbol, Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockImage::Type]
        required :type, enum: -> { Cadenya::Objectives::SetToolCallContentRequestContentBlockImage::Type }

        # @!method initialize(image:, type:)
        #   @param image [Cadenya::Models::Objectives::SetToolCallContentRequestImageBlock]
        #   @param type [Symbol, Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockImage::Type]

        # @see Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockImage#type
        module Type
          extend Cadenya::Internal::Type::Enum

          IMAGE = :image

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
