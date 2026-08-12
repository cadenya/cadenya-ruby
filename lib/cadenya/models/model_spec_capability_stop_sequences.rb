# frozen_string_literal: true

module Cadenya
  module Models
    class ModelSpecCapabilityStopSequences < Cadenya::Internal::Type::BaseModel
      # @!attribute stop_sequences
      #   Custom stop sequences (ModelConfig.stop_sequences).
      #
      #   @return [Cadenya::Models::CapabilityStopSequences]
      required :stop_sequences, -> { Cadenya::CapabilityStopSequences }, api_name: :stopSequences

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ModelSpecCapabilityStopSequences::Type]
      required :type, enum: -> { Cadenya::ModelSpecCapabilityStopSequences::Type }

      # @!method initialize(stop_sequences:, type:)
      #   @param stop_sequences [Cadenya::Models::CapabilityStopSequences] Custom stop sequences (ModelConfig.stop_sequences).
      #
      #   @param type [Symbol, Cadenya::Models::ModelSpecCapabilityStopSequences::Type]

      # @see Cadenya::Models::ModelSpecCapabilityStopSequences#type
      module Type
        extend Cadenya::Internal::Type::Enum

        STOP_SEQUENCES = :stopSequences

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
