# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Objectives#continue
    class ObjectiveContinueResponse < Cadenya::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Cadenya::Models::ObjectiveEventData]
      required :data, -> { Cadenya::ObjectiveEventData }

      # @!attribute metadata
      #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #   runs)
      #
      #   @return [Cadenya::Models::OperationMetadata]
      required :metadata, -> { Cadenya::OperationMetadata }

      # @!attribute context_window_id
      #
      #   @return [String, nil]
      optional :context_window_id, String, api_name: :contextWindowId

      # @!attribute info
      #
      #   @return [Cadenya::Models::ObjectiveEventInfo, nil]
      optional :info, -> { Cadenya::ObjectiveEventInfo }

      # @!method initialize(data:, metadata:, context_window_id: nil, info: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveContinueResponse} for more details.
      #
      #   @param data [Cadenya::Models::ObjectiveEventData]
      #
      #   @param metadata [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #
      #   @param context_window_id [String]
      #
      #   @param info [Cadenya::Models::ObjectiveEventInfo]
    end
  end
end
