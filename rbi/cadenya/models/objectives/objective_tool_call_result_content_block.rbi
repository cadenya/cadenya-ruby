# typed: strong

module Cadenya
  module Models
    ObjectiveToolCallResultContentBlock =
      Objectives::ObjectiveToolCallResultContentBlock

    module Objectives
      class ObjectiveToolCallResultContentBlock < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveToolCallResultContentBlock,
              Cadenya::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(Cadenya::Objectives::ObjectiveToolCallResultAudioBlock)
          )
        end
        attr_reader :audio

        sig do
          params(
            audio:
              Cadenya::Objectives::ObjectiveToolCallResultAudioBlock::OrHash
          ).void
        end
        attr_writer :audio

        sig do
          returns(
            T.nilable(Cadenya::Objectives::ObjectiveToolCallResultImageBlock)
          )
        end
        attr_reader :image

        sig do
          params(
            image:
              Cadenya::Objectives::ObjectiveToolCallResultImageBlock::OrHash
          ).void
        end
        attr_writer :image

        sig do
          returns(
            T.nilable(Cadenya::Objectives::ObjectiveToolCallResultTextBlock)
          )
        end
        attr_reader :text

        sig do
          params(
            text: Cadenya::Objectives::ObjectiveToolCallResultTextBlock::OrHash
          ).void
        end
        attr_writer :text

        # The JSON name of the variant set in `block` (e.g. "text"). Filled by the server;
        # drives the discriminated union in the generated OpenAPI.
        sig { returns(T.nilable(String)) }
        attr_reader :type

        sig { params(type: String).void }
        attr_writer :type

        # ContentBlock is a single block of tool result content. Exactly one of the
        # variants is set.
        sig do
          params(
            audio:
              Cadenya::Objectives::ObjectiveToolCallResultAudioBlock::OrHash,
            image:
              Cadenya::Objectives::ObjectiveToolCallResultImageBlock::OrHash,
            text: Cadenya::Objectives::ObjectiveToolCallResultTextBlock::OrHash,
            type: String
          ).returns(T.attached_class)
        end
        def self.new(
          audio: nil,
          image: nil,
          text: nil,
          # The JSON name of the variant set in `block` (e.g. "text"). Filled by the server;
          # drives the discriminated union in the generated OpenAPI.
          type: nil
        )
        end

        sig do
          override.returns(
            {
              audio: Cadenya::Objectives::ObjectiveToolCallResultAudioBlock,
              image: Cadenya::Objectives::ObjectiveToolCallResultImageBlock,
              text: Cadenya::Objectives::ObjectiveToolCallResultTextBlock,
              type: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
