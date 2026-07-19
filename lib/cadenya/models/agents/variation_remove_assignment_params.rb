# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      # @see Cadenya::Resources::Agents::Variations#remove_assignment
      class VariationRemoveAssignmentParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String, nil]
        optional :workspace_id, String

        # @!attribute agent_id
        #
        #   @return [String]
        required :agent_id, String

        # @!attribute variation_id
        #
        #   @return [String]
        required :variation_id, String

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!method initialize(agent_id:, variation_id:, id:, workspace_id: nil, request_options: {})
        #   @param agent_id [String]
        #   @param variation_id [String]
        #   @param id [String]
        #   @param workspace_id [String]
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
