# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      # ContentBlock is a single block of tool result content. Exactly one of the
      # variants is set.
      module ObjectiveToolCallResultContentBlock
        extend Cadenya::Internal::Type::Union

        discriminator :type

        variant :text, -> { Cadenya::Objectives::ObjectiveToolCallResultContentBlockText }

        variant :image, -> { Cadenya::Objectives::ObjectiveToolCallResultContentBlockImage }

        variant :audio, -> { Cadenya::Objectives::ObjectiveToolCallResultContentBlockAudio }

        # @!method self.variants
        #   @return [Array(Cadenya::Models::Objectives::ObjectiveToolCallResultContentBlockText, Cadenya::Models::Objectives::ObjectiveToolCallResultContentBlockImage, Cadenya::Models::Objectives::ObjectiveToolCallResultContentBlockAudio)]
      end
    end

    ObjectiveToolCallResultContentBlock = Objectives::ObjectiveToolCallResultContentBlock
  end
end
