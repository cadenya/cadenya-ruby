# frozen_string_literal: true

module Cadenya
  module Models
    module WorkspaceAdmin
      # @see Cadenya::Resources::WorkspaceAdmin::Members#remove
      class MemberRemoveParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!attribute profile_id
        #
        #   @return [String]
        required :profile_id, String

        # @!method initialize(workspace_id:, profile_id:, request_options: {})
        #   @param workspace_id [String]
        #   @param profile_id [String]
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
