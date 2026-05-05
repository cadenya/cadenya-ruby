# typed: strong

module Cadenya
  module Models
    ObjectiveFeedback = Objectives::ObjectiveFeedback

    module Objectives
      class ObjectiveFeedback < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveFeedback,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(Cadenya::Objectives::ObjectiveFeedbackData) }
        attr_reader :data

        sig do
          params(data: Cadenya::Objectives::ObjectiveFeedbackData::OrHash).void
        end
        attr_writer :data

        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        sig { returns(Cadenya::OperationMetadata) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::OperationMetadata::OrHash).void }
        attr_writer :metadata

        sig { returns(T.nilable(Cadenya::Objectives::ObjectiveFeedbackInfo)) }
        attr_reader :info

        sig do
          params(info: Cadenya::Objectives::ObjectiveFeedbackInfo::OrHash).void
        end
        attr_writer :info

        # ObjectiveFeedback represents feedback submitted for an objective's execution.
        # Feedback is used to score agent variations and improve agent performance over
        # time.
        sig do
          params(
            data: Cadenya::Objectives::ObjectiveFeedbackData::OrHash,
            metadata: Cadenya::OperationMetadata::OrHash,
            info: Cadenya::Objectives::ObjectiveFeedbackInfo::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          # Metadata for ephemeral operations and activities (e.g., objectives, executions,
          # runs)
          metadata:,
          info: nil
        )
        end

        sig do
          override.returns(
            {
              data: Cadenya::Objectives::ObjectiveFeedbackData,
              metadata: Cadenya::OperationMetadata,
              info: Cadenya::Objectives::ObjectiveFeedbackInfo
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
