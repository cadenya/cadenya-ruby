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
      end

      # @!method initialize(created_by: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::APIKeyInfo} for more details.
      #
      #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
    end
  end
end
