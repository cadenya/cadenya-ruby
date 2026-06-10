# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class ObjectiveToolCallResultImageBlock < Cadenya::Internal::Type::BaseModel
        response_only do
          # @!attribute expires_at
          #   When the signed URL expires.
          #
          #   @return [Time]
          required :expires_at, Time, api_name: :expiresAt

          # @!attribute mime_type
          #   IANA media type of the stored image, e.g. image/png.
          #
          #   @return [String]
          required :mime_type, String, api_name: :mimeType

          # @!attribute size_bytes
          #   Size of the stored image in bytes.
          #
          #   @return [String]
          required :size_bytes, String, api_name: :sizeBytes

          # @!attribute url
          #   Short-lived signed URL to download the stored image.
          #
          #   @return [String]
          required :url, String
        end

        # @!method initialize(expires_at:, mime_type:, size_bytes:, url:)
        #   @param expires_at [Time] When the signed URL expires.
        #
        #   @param mime_type [String] IANA media type of the stored image, e.g. image/png.
        #
        #   @param size_bytes [String] Size of the stored image in bytes.
        #
        #   @param url [String] Short-lived signed URL to download the stored image.
      end
    end

    ObjectiveToolCallResultImageBlock = Objectives::ObjectiveToolCallResultImageBlock
  end
end
