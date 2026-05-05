# typed: strong

module Cadenya
  module Models
    ObjectiveFeedbackData = Objectives::ObjectiveFeedbackData

    module Objectives
      class ObjectiveFeedbackData < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveFeedbackData,
              Cadenya::Internal::AnyHash
            )
          end

        # Optional human-readable comment explaining the feedback
        sig { returns(T.nilable(String)) }
        attr_reader :comment

        sig { params(comment: String).void }
        attr_writer :comment

        # A score between -1.0 and 1.0 representing the quality of the objective's
        # execution. -1.0 is the worst possible score, 0.0 is neutral, and 1.0 is the
        # best.
        sig { returns(T.nilable(Float)) }
        attr_reader :score

        sig { params(score: Float).void }
        attr_writer :score

        sig { params(comment: String, score: Float).returns(T.attached_class) }
        def self.new(
          # Optional human-readable comment explaining the feedback
          comment: nil,
          # A score between -1.0 and 1.0 representing the quality of the objective's
          # execution. -1.0 is the worst possible score, 0.0 is neutral, and 1.0 is the
          # best.
          score: nil
        )
        end

        sig { override.returns({ comment: String, score: Float }) }
        def to_hash
        end
      end
    end
  end
end
