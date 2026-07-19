# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class ObjectiveToolCallResultContentBlockAudio < Cadenya::Internal::Type::BaseModel
        # @!attribute audio
        #
        #   @return [Cadenya::Models::Objectives::ObjectiveToolCallResultAudioBlock]
        required :audio, -> { Cadenya::Objectives::ObjectiveToolCallResultAudioBlock }

        # @!attribute type
        #
        #   @return [Symbol, Cadenya::Models::Objectives::ObjectiveToolCallResultContentBlockAudio::Type]
        required :type, enum: -> { Cadenya::Objectives::ObjectiveToolCallResultContentBlockAudio::Type }

        # @!method initialize(audio:, type:)
        #   @param audio [Cadenya::Models::Objectives::ObjectiveToolCallResultAudioBlock]
        #   @param type [Symbol, Cadenya::Models::Objectives::ObjectiveToolCallResultContentBlockAudio::Type]

        # @see Cadenya::Models::Objectives::ObjectiveToolCallResultContentBlockAudio#type
        module Type
          extend Cadenya::Internal::Type::Enum

          AUDIO = :audio

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    ObjectiveToolCallResultContentBlockAudio = Objectives::ObjectiveToolCallResultContentBlockAudio
  end
end
