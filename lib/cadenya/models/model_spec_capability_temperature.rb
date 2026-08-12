# frozen_string_literal: true

module Cadenya
  module Models
    class ModelSpecCapabilityTemperature < Cadenya::Internal::Type::BaseModel
      # @!attribute temperature
      #   Sampling temperature (ModelConfig.temperature).
      #
      #   @return [Object]
      required :temperature, Cadenya::Internal::Type::Unknown

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ModelSpecCapabilityTemperature::Type]
      required :type, enum: -> { Cadenya::ModelSpecCapabilityTemperature::Type }

      # @!method initialize(temperature:, type:)
      #   @param temperature [Object] Sampling temperature (ModelConfig.temperature).
      #
      #   @param type [Symbol, Cadenya::Models::ModelSpecCapabilityTemperature::Type]

      # @see Cadenya::Models::ModelSpecCapabilityTemperature#type
      module Type
        extend Cadenya::Internal::Type::Enum

        TEMPERATURE = :temperature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
