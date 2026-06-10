# typed: strong

module Cadenya
  module Models
    ObjectiveToolCallResultAudioBlock =
      Objectives::ObjectiveToolCallResultAudioBlock

    module Objectives
      class ObjectiveToolCallResultAudioBlock < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveToolCallResultAudioBlock,
              Cadenya::Internal::AnyHash
            )
          end

        # When the signed URL expires.
        sig { returns(Time) }
        attr_accessor :expires_at

        # IANA media type of the stored audio, e.g. audio/wav.
        sig { returns(String) }
        attr_accessor :mime_type

        # Size of the stored audio in bytes.
        sig { returns(String) }
        attr_accessor :size_bytes

        # Short-lived signed URL to download the stored audio.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            expires_at: Time,
            mime_type: String,
            size_bytes: String,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # When the signed URL expires.
          expires_at:,
          # IANA media type of the stored audio, e.g. audio/wav.
          mime_type:,
          # Size of the stored audio in bytes.
          size_bytes:,
          # Short-lived signed URL to download the stored audio.
          url:
        )
        end

        sig do
          override.returns(
            {
              expires_at: Time,
              mime_type: String,
              size_bytes: String,
              url: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
