# frozen_string_literal: true

module Cadenya
  module Models
    # Capability describes one inference knob this model supports, with any
    # model-specific parameters for it. A variation's ModelConfig may only set a knob
    # whose capability is listed on the model's spec.
    module ModelSpecCapability
      extend Cadenya::Internal::Type::Union

      discriminator :type

      variant :temperature, -> { Cadenya::ModelSpecCapabilityTemperature }

      variant :topP, -> { Cadenya::ModelSpecCapabilityTopP }

      variant :topK, -> { Cadenya::ModelSpecCapabilityTopK }

      variant :stopSequences, -> { Cadenya::ModelSpecCapabilityStopSequences }

      variant :maxOutputTokens, -> { Cadenya::ModelSpecCapabilityMaxOutputTokens }

      variant :reasoning, -> { Cadenya::ModelSpecCapabilityReasoning }

      # @!method self.variants
      #   @return [Array(Cadenya::Models::ModelSpecCapabilityTemperature, Cadenya::Models::ModelSpecCapabilityTopP, Cadenya::Models::ModelSpecCapabilityTopK, Cadenya::Models::ModelSpecCapabilityStopSequences, Cadenya::Models::ModelSpecCapabilityMaxOutputTokens, Cadenya::Models::ModelSpecCapabilityReasoning)]
    end
  end
end
