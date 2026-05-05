# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Workspaces#list
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

      # @!method initialize(metadata:, spec:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::Workspace} for more details.
      #
      #   @param metadata [Cadenya::Models::AccountResourceMetadata] AccountResourceMetadata is used to represent a resource that is associated to an
      #
      #   @param spec [Cadenya::Models::WorkspaceSpec]
    end
  end
end
