# frozen_string_literal: true

module Cadenya
  module Models
    class ModelSpecCapabilityTopK < Cadenya::Internal::Type::BaseModel
      # @!attribute top_k
      #   Top-k sampling (ModelConfig.top_k).
      #
      #   @return [Object]
      required :top_k, Cadenya::Internal::Type::Unknown, api_name: :topK

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ModelSpecCapabilityTopK::Type]
      required :type, enum: -> { Cadenya::ModelSpecCapabilityTopK::Type }

      # @!method initialize(top_k:, type:)
      #   @param top_k [Object] Top-k sampling (ModelConfig.top_k).
      #
      #   @param type [Symbol, Cadenya::Models::ModelSpecCapabilityTopK::Type]

      # @see Cadenya::Models::ModelSpecCapabilityTopK#type
      module Type
        extend Cadenya::Internal::Type::Enum

        TOP_K = :topK

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
