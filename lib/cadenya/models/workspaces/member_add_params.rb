# frozen_string_literal: true

module Cadenya
  module Models
    module Workspaces
      # @see Cadenya::Resources::Workspaces::Members#add
      class MemberAddParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!attribute profile_id
        #   The existing account profile to add to the workspace.
        #
        #   @return [String, nil]
        optional :profile_id, String, api_name: :profileId

        # @!method initialize(workspace_id:, profile_id: nil, request_options: {})
        #   @param workspace_id [String]
        #
        #   @param profile_id [String] The existing account profile to add to the workspace.
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
