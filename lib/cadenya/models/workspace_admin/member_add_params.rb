# frozen_string_literal: true

module Cadenya
  module Models
    module WorkspaceAdmin
      # @see Cadenya::Resources::WorkspaceAdmin::Members#add
      class MemberAddParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!attribute email
        #   Email address to add (resolve-or-invite). Mutually exclusive with profile_id.
        #
        #   @return [String, nil]
        optional :email, String

        # @!attribute profile_id
        #   An existing account profile to add. Mutually exclusive with email.
        #
        #   @return [String, nil]
        optional :profile_id, String, api_name: :profileId

        # @!method initialize(workspace_id:, email: nil, profile_id: nil, request_options: {})
        #   @param workspace_id [String]
        #
        #   @param email [String] Email address to add (resolve-or-invite). Mutually exclusive with profile_id.
        #
        #   @param profile_id [String] An existing account profile to add. Mutually exclusive with email.
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
