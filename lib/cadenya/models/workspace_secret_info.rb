# frozen_string_literal: true

module Cadenya
  module Models
    class WorkspaceSecretInfo < Cadenya::Internal::Type::BaseModel
      # @!attribute created_by
      #   A profile identifies a user or non-human principal (such as an API key) at the
      #   account level. Profiles are account-scoped and can be granted access to multiple
      #   workspaces.
      #
      #   @return [Cadenya::Models::Profile, nil]
      optional :created_by, -> { Cadenya::Profile }, api_name: :createdBy

      response_only do
        # @!attribute last_used_at
        #
        #   @return [Time, nil]
        optional :last_used_at, Time, api_name: :lastUsedAt
      end

      # @!method initialize(created_by: nil, last_used_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::WorkspaceSecretInfo} for more details.
      #
      #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
      #
      #   @param last_used_at [Time]
    end
  end
end
