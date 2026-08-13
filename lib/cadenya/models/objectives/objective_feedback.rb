# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      # @see Cadenya::Resources::Objectives::Feedback#create
      class ObjectiveFeedback < Cadenya::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [Cadenya::Models::Objectives::ObjectiveFeedbackData]
        required :data, -> { Cadenya::Objectives::ObjectiveFeedbackData }

        # @!attribute metadata
        #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
        #   runs)
        #
        #   @return [Cadenya::Models::OperationMetadata]
        required :metadata, -> { Cadenya::OperationMetadata }

        # @!attribute info
        #
        #   @return [Cadenya::Models::Objectives::ObjectiveFeedbackInfo]
        required :info, -> { Cadenya::Objectives::ObjectiveFeedbackInfo }

        # @!method initialize(data:, metadata:, info:)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Objectives::ObjectiveFeedback} for more details.
        #
        #   ObjectiveFeedback represents feedback submitted for an objective's execution.
        #   Feedback is used to score agent variations and improve agent performance over
        #   time.
        #
        #   @param data [Cadenya::Models::Objectives::ObjectiveFeedbackData]
        #
        #   @param metadata [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
        #
        #   @param info [Cadenya::Models::Objectives::ObjectiveFeedbackInfo]
      end
    end

    ObjectiveFeedback = Objectives::ObjectiveFeedback
  end
end
