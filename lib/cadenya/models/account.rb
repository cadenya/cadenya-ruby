# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Account#retrieve
    class AccountAPI < Cadenya::Internal::Type::BaseModel
      # @!attribute info
      #   Server-populated information about the account.
      #
      #   @return [Cadenya::Models::AccountInfo]
      required :info, -> { Cadenya::AccountInfo }

      # @!attribute metadata
      #   AccountResourceMetadata is used to represent a resource that is associated to an
      #   account but not to a workspace.
      #
      #   @return [Cadenya::Models::AccountResourceMetadata]
      required :metadata, -> { Cadenya::AccountResourceMetadata }

      # @!attribute spec
      #   Configuration for an account.
      #
      #   @return [Cadenya::Models::AccountSpec]
      required :spec, -> { Cadenya::AccountSpec }

      # @!method initialize(info:, metadata:, spec:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AccountAPI} for more details.
      #
      #   An account, the top-level organizational unit. Contains workspaces and
      #   account-wide settings such as the webhook signing secret.
      #
      #   @param info [Cadenya::Models::AccountInfo] Server-populated information about the account.
      #
      #   @param metadata [Cadenya::Models::AccountResourceMetadata] AccountResourceMetadata is used to represent a resource that is associated to an
      #
      #   @param spec [Cadenya::Models::AccountSpec] Configuration for an account.
    end
  end
end
