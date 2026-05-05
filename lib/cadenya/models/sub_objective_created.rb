# frozen_string_literal: true

module Cadenya
  module Models
    class SubObjectiveCreated < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #   runs)
      #
      #   @return [Cadenya::Models::OperationMetadata, nil]
      optional :metadata, -> { Cadenya::OperationMetadata }

      # @!method initialize(metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::SubObjectiveCreated} for more details.
      #
      #   @param metadata [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
    end
  end
end
