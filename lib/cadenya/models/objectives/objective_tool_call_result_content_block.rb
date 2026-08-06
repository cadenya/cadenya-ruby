# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class ObjectiveToolCallResultContentBlock < Cadenya::Internal::Type::BaseModel
        # @!attribute audio
        #
        #   @return [Cadenya::Models::Objectives::ObjectiveToolCallResultAudioBlock, nil]
        optional :audio, -> { Cadenya::Objectives::ObjectiveToolCallResultAudioBlock }

        # @!attribute image
        #
        #   @return [Cadenya::Models::Objectives::ObjectiveToolCallResultImageBlock, nil]
        optional :image, -> { Cadenya::Objectives::ObjectiveToolCallResultImageBlock }

        # @!attribute text
        #
        #   @return [Cadenya::Models::Objectives::ObjectiveToolCallResultTextBlock, nil]
        optional :text, -> { Cadenya::Objectives::ObjectiveToolCallResultTextBlock }

        # @!attribute type
        #   The JSON name of the variant set in `block` (e.g. "text"). Filled by the server;
        #   drives the discriminated union in the generated OpenAPI.
        #
        #   @return [String, nil]
        optional :type, String

        # @!method initialize(audio: nil, image: nil, text: nil, type: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Objectives::ObjectiveToolCallResultContentBlock} for more
        #   details.
        #
        #   ContentBlock is a single block of tool result content. Exactly one of the
        #   variants is set.
        #
        #   @param audio [Cadenya::Models::Objectives::ObjectiveToolCallResultAudioBlock]
        #
        #   @param image [Cadenya::Models::Objectives::ObjectiveToolCallResultImageBlock]
        #
        #   @param text [Cadenya::Models::Objectives::ObjectiveToolCallResultTextBlock]
        #
        #   @param type [String] The JSON name of the variant set in `block` (e.g. "text"). Filled by the
      end
    end

    ObjectiveToolCallResultContentBlock = Objectives::ObjectiveToolCallResultContentBlock
  end
end
