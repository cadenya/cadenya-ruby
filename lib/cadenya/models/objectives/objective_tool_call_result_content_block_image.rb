# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class ObjectiveToolCallResultContentBlockImage < Cadenya::Internal::Type::BaseModel
        # @!attribute image
        #
        #   @return [Cadenya::Models::Objectives::ObjectiveToolCallResultImageBlock]
        required :image, -> { Cadenya::Objectives::ObjectiveToolCallResultImageBlock }

        # @!attribute type
        #
        #   @return [Symbol, Cadenya::Models::Objectives::ObjectiveToolCallResultContentBlockImage::Type]
        required :type, enum: -> { Cadenya::Objectives::ObjectiveToolCallResultContentBlockImage::Type }

        # @!method initialize(image:, type:)
        #   @param image [Cadenya::Models::Objectives::ObjectiveToolCallResultImageBlock]
        #   @param type [Symbol, Cadenya::Models::Objectives::ObjectiveToolCallResultContentBlockImage::Type]

        # @see Cadenya::Models::Objectives::ObjectiveToolCallResultContentBlockImage#type
        module Type
          extend Cadenya::Internal::Type::Enum

          IMAGE = :image

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    ObjectiveToolCallResultContentBlockImage = Objectives::ObjectiveToolCallResultContentBlockImage
  end
end
