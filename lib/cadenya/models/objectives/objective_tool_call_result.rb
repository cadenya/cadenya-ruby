# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class ObjectiveToolCallResult < Cadenya::Internal::Type::BaseModel
        response_only do
          # @!attribute content
          #
          #   @return [Array<Cadenya::Models::Objectives::ObjectiveToolCallResultContentBlock>]
          required :content,
                   -> { Cadenya::Internal::Type::ArrayOf[Cadenya::Objectives::ObjectiveToolCallResultContentBlock] }
        end

        # @!method initialize(content:)
        #   ObjectiveToolCallResult is the content a tool returned after execution. Tools
        #   can return multiple content blocks, and blocks can be multi-modal (text, image,
        #   audio). Media blocks are stored by Cadenya and served as short-lived signed URLs
        #   rather than inline bytes.
        #
        #   @param content [Array<Cadenya::Models::Objectives::ObjectiveToolCallResultContentBlock>]
      end
    end

    ObjectiveToolCallResult = Objectives::ObjectiveToolCallResult
  end
end
