# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventInfo < Cadenya::Internal::Type::BaseModel
      # @!attribute created_by
      #   A profile identifies a user or non-human principal (such as an API key) at the
      #   account level. Profiles are account-scoped and can be granted access to multiple
      #   workspaces.
      #
      #   @return [Cadenya::Models::Profile, nil]
      optional :created_by, -> { Cadenya::Profile }, api_name: :createdBy

      # @!attribute objective
      #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #   runs)
      #
      #   @return [Cadenya::Models::OperationMetadata, nil]
      optional :objective, -> { Cadenya::OperationMetadata }

      # @!method initialize(created_by: nil, objective: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveEventInfo} for more details.
      #
      #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
      #
      #   @param objective [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
    end
  end
end
