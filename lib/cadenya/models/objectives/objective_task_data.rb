# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class ObjectiveTaskData < Cadenya::Internal::Type::BaseModel
        # @!attribute completed
        #   Whether the task has been completed
        #
        #   @return [Boolean]
        required :completed, Cadenya::Internal::Type::Boolean

        # @!attribute task
        #   Description of the task to be completed
        #
        #   @return [String]
        required :task, String

        response_only do
          # @!attribute number
          #   The sequential number of this task within the objective (auto-assigned, 1-based)
          #
          #   @return [Integer]
          required :number, Integer

          # @!attribute completed_at
          #   Timestamp when the task was marked as completed
          #
          #   @return [Time, nil]
          optional :completed_at, Time, api_name: :completedAt
        end

        # @!method initialize(completed:, number:, task:, completed_at: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Objectives::ObjectiveTaskData} for more details.
        #
        #   @param completed [Boolean] Whether the task has been completed
        #
        #   @param number [Integer] The sequential number of this task within the objective (auto-assigned, 1-based)
        #
        #   @param task [String] Description of the task to be completed
        #
        #   @param completed_at [Time] Timestamp when the task was marked as completed
      end
    end

    ObjectiveTaskData = Objectives::ObjectiveTaskData
  end
end
