# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Objectives#list_context_windows
    class ObjectiveContextWindow < Cadenya::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Cadenya::Models::ObjectiveContextWindowData]
      required :data, -> { Cadenya::ObjectiveContextWindowData }

      # @!attribute metadata
      #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #   runs)
      #
      #   @return [Cadenya::Models::OperationMetadata]
      required :metadata, -> { Cadenya::OperationMetadata }

      # @!attribute info
      #
      #   @return [Cadenya::Models::ObjectiveContextWindow::Info, nil]
      optional :info, -> { Cadenya::ObjectiveContextWindow::Info }

      # @!method initialize(data:, metadata:, info: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveContextWindow} for more details.
      #
      #   ObjectiveContextWindow is a window of chat completions that is grouped together
      #   to prevent context-window overflows. Context windows also allow agents to
      #   compact their windows and carry on into a new one.
      #
      #   @param data [Cadenya::Models::ObjectiveContextWindowData]
      #
      #   @param metadata [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #
      #   @param info [Cadenya::Models::ObjectiveContextWindow::Info]

      # @see Cadenya::Models::ObjectiveContextWindow#info
      class Info < Cadenya::Internal::Type::BaseModel
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
        #   {Cadenya::Models::ObjectiveContextWindow::Info} for more details.
        #
        #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
        #
        #   @param objective [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
      end
    end
  end
end
