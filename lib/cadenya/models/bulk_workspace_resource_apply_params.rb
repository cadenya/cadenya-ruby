# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::BulkWorkspaceResources#apply
    class BulkWorkspaceResourceApplyParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String]
      required :workspace_id, String

      # @!attribute data
      #
      #   @return [Cadenya::Models::BulkWorkspaceApplyData]
      required :data, -> { Cadenya::BulkWorkspaceApplyData }

      # @!method initialize(workspace_id:, data:, request_options: {})
      #   @param workspace_id [String]
      #   @param data [Cadenya::Models::BulkWorkspaceApplyData]
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
