# frozen_string_literal: true

module Cadenya
  module Models
    class APIKeyInfo < Cadenya::Internal::Type::BaseModel
      response_only do
        # @!attribute created_by
        #   A profile identifies a user or non-human principal (such as an API key) at the
        #   account level. Profiles are account-scoped and can be granted access to multiple
        #   workspaces.
        #
        #   @return [Cadenya::Models::Profile, nil]
        optional :created_by, -> { Cadenya::Profile }, api_name: :createdBy

        # @!attribute workspaces_preview
        #   Up to a small number of workspaces this key has access to, intended for display
        #   ("Workspace 1, Workspace 2, and 4 more"). Use ListAPIKeyWorkspaces for the full
        #   paginated list.
        #
        #   @return [Array<Cadenya::Models::BareMetadata>, nil]
        optional :workspaces_preview,
                 -> { Cadenya::Internal::Type::ArrayOf[Cadenya::BareMetadata] },
                 api_name: :workspacesPreview

        # @!attribute workspaces_total
        #   Total number of workspaces this key has access to.
        #
        #   @return [Integer, nil]
        optional :workspaces_total, Integer, api_name: :workspacesTotal
      end

      # @!method initialize(created_by: nil, workspaces_preview: nil, workspaces_total: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::APIKeyInfo} for more details.
      #
      #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
      #
      #   @param workspaces_preview [Array<Cadenya::Models::BareMetadata>] Up to a small number of workspaces this key has access to, intended
      #
      #   @param workspaces_total [Integer] Total number of workspaces this key has access to.
    end
  end
end
