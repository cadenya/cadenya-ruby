# frozen_string_literal: true

module Cadenya
  module Models
    class CapabilityStopSequences < Cadenya::Internal::Type::BaseModel
      # @!attribute limit
      #   Maximum number of stop sequences the model accepts per request. 0 means the
      #   provider imposes no meaningful limit.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(limit: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::CapabilityStopSequences} for more details.
      #
      #   Custom stop sequences (ModelConfig.stop_sequences).
      #
      #   @param limit [Integer] Maximum number of stop sequences the model accepts per request.
    end
  end
end
