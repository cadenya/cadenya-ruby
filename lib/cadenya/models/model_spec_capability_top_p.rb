# frozen_string_literal: true

module Cadenya
  module Models
    class ModelSpecCapabilityTopP < Cadenya::Internal::Type::BaseModel
      # @!attribute top_p
      #   Nucleus sampling (ModelConfig.top_p).
      #
      #   @return [Object]
      required :top_p, Cadenya::Internal::Type::Unknown, api_name: :topP

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ModelSpecCapabilityTopP::Type]
      required :type, enum: -> { Cadenya::ModelSpecCapabilityTopP::Type }

      # @!method initialize(top_p:, type:)
      #   @param top_p [Object] Nucleus sampling (ModelConfig.top_p).
      #
      #   @param type [Symbol, Cadenya::Models::ModelSpecCapabilityTopP::Type]

      # @see Cadenya::Models::ModelSpecCapabilityTopP#type
      module Type
        extend Cadenya::Internal::Type::Enum

        TOP_P = :topP

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
