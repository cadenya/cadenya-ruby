# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Objectives#create
    class Objective < Cadenya::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Cadenya::Models::ObjectiveData]
      required :data, -> { Cadenya::ObjectiveData }

      # @!attribute metadata
      #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #   runs)
      #
      #   @return [Cadenya::Models::OperationMetadata]
      required :metadata, -> { Cadenya::OperationMetadata }

      # @!attribute status
      #
      #   @return [Cadenya::Models::ObjectiveStatus]
      required :status, -> { Cadenya::ObjectiveStatus }

      response_only do
        # @!attribute info
        #   ObjectiveInfo provides read-only aggregated statistics about an objective's
        #   execution
        #
        #   @return [Cadenya::Models::ObjectiveInfo, nil]
        optional :info, -> { Cadenya::ObjectiveInfo }

        # @!attribute last_five_windows
        #   Read-only list of the last five windows of execution for this objective, ordered
        #   by most recent first. Is only included in singular RPC calls (GetObjective, for
        #   example).
        #
        #   @return [Array<Cadenya::Models::ObjectiveContextWindow>, nil]
        optional :last_five_windows,
                 -> { Cadenya::Internal::Type::ArrayOf[Cadenya::ObjectiveContextWindow] },
                 api_name: :lastFiveWindows
      end

      # @!method initialize(data:, metadata:, status:, info: nil, last_five_windows: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::Objective} for more details.
      #
      #   @param data [Cadenya::Models::ObjectiveData]
      #
      #   @param metadata [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #
      #   @param status [Cadenya::Models::ObjectiveStatus]
      #
      #   @param info [Cadenya::Models::ObjectiveInfo] ObjectiveInfo provides read-only aggregated statistics about an objective's exec
      #
      #   @param last_five_windows [Array<Cadenya::Models::ObjectiveContextWindow>] Read-only list of the last five windows of execution for this objective, ordered
    end
  end
end
