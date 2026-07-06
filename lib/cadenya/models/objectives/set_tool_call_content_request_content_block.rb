# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class SetToolCallContentRequestContentBlock < Cadenya::Internal::Type::BaseModel
        # @!attribute audio
        #
        #   @return [Cadenya::Models::Objectives::SetToolCallContentRequestAudioBlock, nil]
        optional :audio, -> { Cadenya::Objectives::SetToolCallContentRequestAudioBlock }

        # @!attribute image
        #
        #   @return [Cadenya::Models::Objectives::SetToolCallContentRequestImageBlock, nil]
        optional :image, -> { Cadenya::Objectives::SetToolCallContentRequestImageBlock }

        # @!attribute text
        #
        #   @return [Cadenya::Models::Objectives::SetToolCallContentRequestTextBlock, nil]
        optional :text, -> { Cadenya::Objectives::SetToolCallContentRequestTextBlock }

        # @!method initialize(audio: nil, image: nil, text: nil)
        #   ContentBlock is a single block of tool call content supplied on input. Exactly
        #   one of the variants is set.
        #
        #   @param audio [Cadenya::Models::Objectives::SetToolCallContentRequestAudioBlock]
        #   @param image [Cadenya::Models::Objectives::SetToolCallContentRequestImageBlock]
        #   @param text [Cadenya::Models::Objectives::SetToolCallContentRequestTextBlock]
      end
    end
  end
end
