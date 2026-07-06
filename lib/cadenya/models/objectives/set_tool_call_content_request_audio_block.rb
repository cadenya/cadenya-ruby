# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class SetToolCallContentRequestAudioBlock < Cadenya::Internal::Type::BaseModel
        # @!attribute data
        #   Base64-encoded audio bytes.
        #
        #   @return [String]
        required :data, String

        # @!attribute mime_type
        #   IANA media type of the audio, e.g. audio/wav.
        #
        #   @return [String]
        required :mime_type, String, api_name: :mimeType

        # @!method initialize(data:, mime_type:)
        #   @param data [String] Base64-encoded audio bytes.
        #
        #   @param mime_type [String] IANA media type of the audio, e.g. audio/wav.
      end
    end
  end
end
