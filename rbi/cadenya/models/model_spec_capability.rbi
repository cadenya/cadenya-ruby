# typed: strong

module Cadenya
  module Models
    # Capability describes one inference knob this model supports, with any
    # model-specific parameters for it. A variation's ModelConfig may only set a knob
    # whose capability is listed on the model's spec.
    module ModelSpecCapability
      extend Cadenya::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Cadenya::ModelSpecCapabilityTemperature,
            Cadenya::ModelSpecCapabilityTopP,
            Cadenya::ModelSpecCapabilityTopK,
            Cadenya::ModelSpecCapabilityStopSequences,
            Cadenya::ModelSpecCapabilityMaxOutputTokens,
            Cadenya::ModelSpecCapabilityReasoning
          )
        end

      sig { override.returns(T::Array[Cadenya::ModelSpecCapability::Variants]) }
      def self.variants
      end
    end
  end
end
