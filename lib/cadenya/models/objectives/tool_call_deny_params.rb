# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      # @see Cadenya::Resources::Objectives::ToolCalls#deny
      class ToolCallDenyParams < Cadenya::Internal::Type::BaseModel
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

        # @!attribute memo
        #   A memo to associate to the tool call denial. Use a memo to steer the LLM to a
        #   different decision or usage of the tool.
        #
        #   @return [String, nil]
        optional :memo, String

        # @!method initialize(objective_id:, tool_call_id:, workspace_id: nil, memo: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Objectives::ToolCallDenyParams} for more details.
        #
        #   @param objective_id [String]
        #
        #   @param tool_call_id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param memo [String] A memo to associate to the tool call denial. Use a memo to steer the LLM to a di
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
