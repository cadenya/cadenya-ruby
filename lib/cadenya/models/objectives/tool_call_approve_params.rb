# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      # @see Cadenya::Resources::Objectives::ToolCalls#approve
      class ToolCallApproveParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String, nil]
        optional :workspace_id, String

        # @!attribute objective_id
        #
        #   @return [String]
        required :objective_id, String

        # @!attribute tool_call_id
        #
        #   @return [String]
        required :tool_call_id, String

        # @!method initialize(objective_id:, tool_call_id:, workspace_id: nil, request_options: {})
        #   @param objective_id [String]
        #   @param tool_call_id [String]
        #   @param workspace_id [String]
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
