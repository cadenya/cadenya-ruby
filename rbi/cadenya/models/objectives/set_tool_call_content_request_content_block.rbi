# typed: strong

module Cadenya
  module Models
    module Objectives
      # ContentBlock is a single block of tool call content supplied on input. Exactly
      # one of the variants is set.
      module SetToolCallContentRequestContentBlock
        extend Cadenya::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Cadenya::Objectives::SetToolCallContentRequestContentBlockText,
              Cadenya::Objectives::SetToolCallContentRequestContentBlockImage,
              Cadenya::Objectives::SetToolCallContentRequestContentBlockAudio
            )
          end

        sig do
          override.returns(
            T::Array[
              Cadenya::Objectives::SetToolCallContentRequestContentBlock::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
