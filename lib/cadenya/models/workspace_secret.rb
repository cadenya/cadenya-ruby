# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::WorkspaceSecrets#create
    class WorkspaceSecret < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata]
      required :metadata, -> { Cadenya::ResourceMetadata }

      # @!attribute spec
      #
      #   @return [Cadenya::Models::WorkspaceSecretSpec]
      required :spec, -> { Cadenya::WorkspaceSecretSpec }

      response_only do
        # @!attribute info
        #   Workspace secret information
        #
        #   @return [Cadenya::Models::WorkspaceSecretInfo, nil]
        optional :info, -> { Cadenya::WorkspaceSecretInfo }
      end

      # @!method initialize(metadata:, spec:, info: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::WorkspaceSecret} for more details.
      #
      #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param spec [Cadenya::Models::WorkspaceSecretSpec]
      #
      #   @param info [Cadenya::Models::WorkspaceSecretInfo] Workspace secret information
    end
  end
end
