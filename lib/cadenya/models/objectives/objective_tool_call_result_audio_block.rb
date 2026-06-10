# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class ObjectiveToolCallResultAudioBlock < Cadenya::Internal::Type::BaseModel
        response_only do
          # @!attribute expires_at
          #   When the signed URL expires.
          #
          #   @return [Time]
          required :expires_at, Time, api_name: :expiresAt

          # @!attribute mime_type
          #   IANA media type of the stored audio, e.g. audio/wav.
          #
          #   @return [String]
          required :mime_type, String, api_name: :mimeType

          # @!attribute size_bytes
          #   Size of the stored audio in bytes.
          #
          #   @return [String]
          required :size_bytes, String, api_name: :sizeBytes

          # @!attribute url
          #   Short-lived signed URL to download the stored audio.
          #
          #   @return [String]
          required :url, String
        end

        # @!method initialize(expires_at:, mime_type:, size_bytes:, url:)
        #   @param expires_at [Time] When the signed URL expires.
        #
        #   @param mime_type [String] IANA media type of the stored audio, e.g. audio/wav.
        #
        #   @param size_bytes [String] Size of the stored audio in bytes.
        #
        #   @param url [String] Short-lived signed URL to download the stored audio.
      end
    end

    ObjectiveToolCallResultAudioBlock = Objectives::ObjectiveToolCallResultAudioBlock
  end
end
