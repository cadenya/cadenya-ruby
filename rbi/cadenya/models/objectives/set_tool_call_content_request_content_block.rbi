# typed: strong

module Cadenya
  module Models
    module Objectives
      class SetToolCallContentRequestContentBlock < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::SetToolCallContentRequestContentBlock,
              Cadenya::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(Cadenya::Objectives::SetToolCallContentRequestAudioBlock)
          )
        end
        attr_reader :audio

        sig do
          params(
            audio:
              Cadenya::Objectives::SetToolCallContentRequestAudioBlock::OrHash
          ).void
        end
        attr_writer :audio

        sig do
          returns(
            T.nilable(Cadenya::Objectives::SetToolCallContentRequestImageBlock)
          )
        end
        attr_reader :image

        sig do
          params(
            image:
              Cadenya::Objectives::SetToolCallContentRequestImageBlock::OrHash
          ).void
        end
        attr_writer :image

        sig do
          returns(
            T.nilable(Cadenya::Objectives::SetToolCallContentRequestTextBlock)
          )
        end
        attr_reader :text

        sig do
          params(
            text:
              Cadenya::Objectives::SetToolCallContentRequestTextBlock::OrHash
          ).void
        end
        attr_writer :text

        # ContentBlock is a single block of tool call content supplied on input. Exactly
        # one of the variants is set.
        sig do
          params(
            audio:
              Cadenya::Objectives::SetToolCallContentRequestAudioBlock::OrHash,
            image:
              Cadenya::Objectives::SetToolCallContentRequestImageBlock::OrHash,
            text:
              Cadenya::Objectives::SetToolCallContentRequestTextBlock::OrHash
          ).returns(T.attached_class)
        end
        def self.new(audio: nil, image: nil, text: nil)
        end

        sig do
          override.returns(
            {
              audio: Cadenya::Objectives::SetToolCallContentRequestAudioBlock,
              image: Cadenya::Objectives::SetToolCallContentRequestImageBlock,
              text: Cadenya::Objectives::SetToolCallContentRequestTextBlock
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
