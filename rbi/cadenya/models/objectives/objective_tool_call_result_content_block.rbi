# typed: strong

module Cadenya
  module Models
    ObjectiveToolCallResultContentBlock =
      Objectives::ObjectiveToolCallResultContentBlock

    module Objectives
      # ContentBlock is a single block of tool result content. Exactly one of the
      # variants is set.
      module ObjectiveToolCallResultContentBlock
        extend Cadenya::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveToolCallResultContentBlockText,
              Cadenya::Objectives::ObjectiveToolCallResultContentBlockImage,
              Cadenya::Objectives::ObjectiveToolCallResultContentBlockAudio
            )
          end

        sig do
          override.returns(
            T::Array[
              Cadenya::Objectives::ObjectiveToolCallResultContentBlock::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
