# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::APIKeys#create
    class APIKey < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   AccountResourceMetadata is used to represent a resource that is associated to an
      #   account but not to a workspace.
      #
      #   @return [Cadenya::Models::AccountResourceMetadata]
      required :metadata, -> { Cadenya::AccountResourceMetadata }

      # @!attribute spec
      #   Configuration for an API key.
      #
      #   @return [Cadenya::Models::APIKeySpec]
      required :spec, -> { Cadenya::APIKeySpec }

      # @!attribute info
      #
      #   @return [Cadenya::Models::APIKeyInfo, nil]
      optional :info, -> { Cadenya::APIKeyInfo }

      # @!method initialize(metadata:, spec:, info: nil)
      #   Some parameter documentations has been truncated, see {Cadenya::Models::APIKey}
      #   for more details.
      #
      #   An API key for the account. Use workspace-association RPCs to grant the key
      #   access to specific workspaces; a key with zero workspaces is valid but cannot
      #   access workspace-scoped resources.
      #
      #   @param metadata [Cadenya::Models::AccountResourceMetadata] AccountResourceMetadata is used to represent a resource that is associated to an
      #
      #   @param spec [Cadenya::Models::APIKeySpec] Configuration for an API key.
      #
      #   @param info [Cadenya::Models::APIKeyInfo]
    end
  end
end
