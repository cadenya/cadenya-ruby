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

        # @!attribute type
        #   The JSON name of the variant set in `block` (e.g. "text"). Required on input;
        #   drives the discriminated union in the generated OpenAPI.
        #
        #   @return [String, nil]
        optional :type, String

        # @!method initialize(audio: nil, image: nil, text: nil, type: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Objectives::SetToolCallContentRequestContentBlock} for more
        #   details.
        #
        #   ContentBlock is a single block of tool call content supplied on input. Exactly
        #   one of the variants is set.
        #
        #   @param audio [Cadenya::Models::Objectives::SetToolCallContentRequestAudioBlock]
        #
        #   @param image [Cadenya::Models::Objectives::SetToolCallContentRequestImageBlock]
        #
        #   @param text [Cadenya::Models::Objectives::SetToolCallContentRequestTextBlock]
        #
        #   @param type [String] The JSON name of the variant set in `block` (e.g. "text"). Required
      end
    end
  end
end
