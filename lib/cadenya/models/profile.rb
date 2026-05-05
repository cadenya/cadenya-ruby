# frozen_string_literal: true

module Cadenya
  module Models
    class Profile < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   AccountResourceMetadata is used to represent a resource that is associated to an
      #   account but not to a workspace.
      #
      #   @return [Cadenya::Models::AccountResourceMetadata]
      required :metadata, -> { Cadenya::AccountResourceMetadata }

      # @!attribute spec
      #   Configuration for a profile.
      #
      #   @return [Cadenya::Models::ProfileSpec]
      required :spec, -> { Cadenya::ProfileSpec }

      # @!method initialize(metadata:, spec:)
      #   Some parameter documentations has been truncated, see {Cadenya::Models::Profile}
      #   for more details.
      #
      #   A profile identifies a user or non-human principal (such as an API key) at the
      #   account level. Profiles are account-scoped and can be granted access to multiple
      #   workspaces.
      #
      #   @param metadata [Cadenya::Models::AccountResourceMetadata] AccountResourceMetadata is used to represent a resource that is associated to an
      #
      #   @param spec [Cadenya::Models::ProfileSpec] Configuration for a profile.
    end
  end
end
