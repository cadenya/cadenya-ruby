# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::WorkspaceAdmin#retrieve
    class WorkspaceAdminRetrieveParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!method initialize(workspace_id: nil, request_options: {})
      #   @param workspace_id [String]
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
