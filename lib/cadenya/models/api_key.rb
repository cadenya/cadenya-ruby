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

      response_only do
        # @!attribute state
        #   The current lifecycle state of the API key. Output only. Keys are created
        #   STATE_ENABLED; use the :disable and :enable actions to transition between
        #   states.
        #
        #   @return [Symbol, Cadenya::Models::APIKey::State]
        required :state, enum: -> { Cadenya::APIKey::State }
      end

      # @!method initialize(metadata:, spec:, state:, info: nil)
      #   Some parameter documentations has been truncated, see {Cadenya::Models::APIKey}
      #   for more details.
      #
      #   An API key. Every key belongs to exactly one workspace and is managed via the
      #   workspace-scoped API key routes. The only exception is the system-managed global
      #   account key, which spans all workspaces and is managed via the account
      #   global_api_key routes.
      #
      #   @param metadata [Cadenya::Models::AccountResourceMetadata] AccountResourceMetadata is used to represent a resource that is associated to an
      #
      #   @param spec [Cadenya::Models::APIKeySpec] Configuration for an API key.
      #
      #   @param state [Symbol, Cadenya::Models::APIKey::State] The current lifecycle state of the API key. Output only. Keys are
      #
      #   @param info [Cadenya::Models::APIKeyInfo]

      # The current lifecycle state of the API key. Output only. Keys are created
      # STATE_ENABLED; use the :disable and :enable actions to transition between
      # states.
      #
      # @see Cadenya::Models::APIKey#state
      module State
        extend Cadenya::Internal::Type::Enum

        STATE_UNSPECIFIED = :STATE_UNSPECIFIED
        STATE_ENABLED = :STATE_ENABLED
        STATE_DISABLED = :STATE_DISABLED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
