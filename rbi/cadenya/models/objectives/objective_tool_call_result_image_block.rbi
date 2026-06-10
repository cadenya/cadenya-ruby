# typed: strong

module Cadenya
  module Models
    ObjectiveToolCallResultImageBlock =
      Objectives::ObjectiveToolCallResultImageBlock

    module Objectives
      class ObjectiveToolCallResultImageBlock < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveToolCallResultImageBlock,
              Cadenya::Internal::AnyHash
            )
          end

        # When the signed URL expires.
        sig { returns(Time) }
        attr_accessor :expires_at

        # IANA media type of the stored image, e.g. image/png.
        sig { returns(String) }
        attr_accessor :mime_type

        # Size of the stored image in bytes.
        sig { returns(String) }
        attr_accessor :size_bytes

        # Short-lived signed URL to download the stored image.
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
          # IANA media type of the stored image, e.g. image/png.
          mime_type:,
          # Size of the stored image in bytes.
          size_bytes:,
          # Short-lived signed URL to download the stored image.
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
