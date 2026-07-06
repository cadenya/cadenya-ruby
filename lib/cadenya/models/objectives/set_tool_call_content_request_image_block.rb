# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class SetToolCallContentRequestImageBlock < Cadenya::Internal::Type::BaseModel
        # @!attribute data
        #   Base64-encoded image bytes.
        #
        #   @return [String]
        required :data, String

        # @!attribute mime_type
        #   IANA media type of the image, e.g. image/png.
        #
        #   @return [String]
        required :mime_type, String, api_name: :mimeType

        # @!method initialize(data:, mime_type:)
        #   @param data [String] Base64-encoded image bytes.
        #
        #   @param mime_type [String] IANA media type of the image, e.g. image/png.
      end
    end
  end
end
