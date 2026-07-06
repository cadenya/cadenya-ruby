# typed: strong

module Cadenya
  module Models
    module Objectives
      class SetToolCallContentRequestImageBlock < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::SetToolCallContentRequestImageBlock,
              Cadenya::Internal::AnyHash
            )
          end

        # Base64-encoded image bytes.
        sig { returns(String) }
        attr_accessor :data

        # IANA media type of the image, e.g. image/png.
        sig { returns(String) }
        attr_accessor :mime_type

        sig do
          params(data: String, mime_type: String).returns(T.attached_class)
        end
        def self.new(
          # Base64-encoded image bytes.
          data:,
          # IANA media type of the image, e.g. image/png.
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
