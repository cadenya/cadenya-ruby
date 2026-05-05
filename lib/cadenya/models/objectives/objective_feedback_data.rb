# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class ObjectiveFeedbackData < Cadenya::Internal::Type::BaseModel
        # @!attribute comment
        #   Optional human-readable comment explaining the feedback
        #
        #   @return [String, nil]
        optional :comment, String

        # @!attribute score
        #   A score between -1.0 and 1.0 representing the quality of the objective's
        #   execution. -1.0 is the worst possible score, 0.0 is neutral, and 1.0 is the
        #   best.
        #
        #   @return [Float, nil]
        optional :score, Float

        # @!method initialize(comment: nil, score: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Objectives::ObjectiveFeedbackData} for more details.
        #
        #   @param comment [String] Optional human-readable comment explaining the feedback
        #
        #   @param score [Float] A score between -1.0 and 1.0 representing the quality of the objective's executi
      end
    end

    ObjectiveFeedbackData = Objectives::ObjectiveFeedbackData
  end
end
