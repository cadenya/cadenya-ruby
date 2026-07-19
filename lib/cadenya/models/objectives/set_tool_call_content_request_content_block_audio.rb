# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class SetToolCallContentRequestContentBlockAudio < Cadenya::Internal::Type::BaseModel
        # @!attribute audio
        #
        #   @return [Cadenya::Models::Objectives::SetToolCallContentRequestAudioBlock]
        required :audio, -> { Cadenya::Objectives::SetToolCallContentRequestAudioBlock }

        # @!attribute type
        #
        #   @return [Symbol, Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockAudio::Type]
        required :type, enum: -> { Cadenya::Objectives::SetToolCallContentRequestContentBlockAudio::Type }

        # @!method initialize(audio:, type:)
        #   @param audio [Cadenya::Models::Objectives::SetToolCallContentRequestAudioBlock]
        #   @param type [Symbol, Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockAudio::Type]

        # @see Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockAudio#type
        module Type
          extend Cadenya::Internal::Type::Enum

          AUDIO = :audio

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
