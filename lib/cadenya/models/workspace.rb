# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Workspaces#create
    class Workspace < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   AccountResourceMetadata is used to represent a resource that is associated to an
      #   account but not to a workspace.
      #
      #   @return [Cadenya::Models::AccountResourceMetadata]
      required :metadata, -> { Cadenya::AccountResourceMetadata }

      # @!attribute spec
      #
      #   @return [Cadenya::Models::WorkspaceSpec]
      required :spec, -> { Cadenya::WorkspaceSpec }

      response_only do
        # @!attribute status
        #   Lifecycle status of the workspace. Archived workspaces reject all requests
        #   scoped to them. Server-populated.
        #
        #   @return [Symbol, Cadenya::Models::Workspace::Status, nil]
        optional :status, enum: -> { Cadenya::Workspace::Status }
      end

      # @!method initialize(metadata:, spec:, status: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::Workspace} for more details.
      #
      #   @param metadata [Cadenya::Models::AccountResourceMetadata] AccountResourceMetadata is used to represent a resource that is associated to an
      #
      #   @param spec [Cadenya::Models::WorkspaceSpec]
      #
      #   @param status [Symbol, Cadenya::Models::Workspace::Status] Lifecycle status of the workspace. Archived workspaces reject all

      # Lifecycle status of the workspace. Archived workspaces reject all requests
      # scoped to them. Server-populated.
      #
      # @see Cadenya::Models::Workspace#status
      module Status
        extend Cadenya::Internal::Type::Enum

        STATUS_ENABLED = :STATUS_ENABLED
        STATUS_DISABLED = :STATUS_DISABLED
        STATUS_ARCHIVED = :STATUS_ARCHIVED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
