# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      # ContentBlock is a single block of tool call content supplied on input. Exactly
      # one of the variants is set.
      module SetToolCallContentRequestContentBlock
        extend Cadenya::Internal::Type::Union

        discriminator :type

        variant :text, -> { Cadenya::Objectives::SetToolCallContentRequestContentBlockText }

        variant :image, -> { Cadenya::Objectives::SetToolCallContentRequestContentBlockImage }

        variant :audio, -> { Cadenya::Objectives::SetToolCallContentRequestContentBlockAudio }

        # @!method self.variants
        #   @return [Array(Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockText, Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockImage, Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockAudio)]
      end
    end
  end
end
