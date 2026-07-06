# typed: strong

module Cadenya
  module Models
    module Objectives
      class SetToolCallContentRequestAudioBlock < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::SetToolCallContentRequestAudioBlock,
              Cadenya::Internal::AnyHash
            )
          end

        # Base64-encoded audio bytes.
        sig { returns(String) }
        attr_accessor :data

        # IANA media type of the audio, e.g. audio/wav.
        sig { returns(String) }
        attr_accessor :mime_type

        sig do
          params(data: String, mime_type: String).returns(T.attached_class)
        end
        def self.new(
          # Base64-encoded audio bytes.
          data:,
          # IANA media type of the audio, e.g. audio/wav.
          mime_type:
        )
        end

        sig { override.returns({ data: String, mime_type: String }) }
        def to_hash
        end
      end
    end
  end
end
