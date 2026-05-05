# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      # @see Cadenya::Resources::Objectives::ToolCalls#list
      class ToolCallListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!attribute objective_id
        #
        #   @return [String]
        required :objective_id, String

        # @!attribute cursor
        #   Pagination cursor from previous response
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute include_info
        #   When set to true you may use more of your alloted API rate-limit
        #
        #   @return [Boolean, nil]
        optional :include_info, Cadenya::Internal::Type::Boolean

        # @!attribute limit
        #   Maximum number of results to return
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute status
        #   Filter by tool call status
        #
        #   @return [Symbol, Cadenya::Models::Objectives::ToolCallListParams::Status, nil]
        optional :status, enum: -> { Cadenya::Objectives::ToolCallListParams::Status }

        # @!method initialize(workspace_id:, objective_id:, cursor: nil, include_info: nil, limit: nil, status: nil, request_options: {})
        #   @param workspace_id [String]
        #
        #   @param objective_id [String]
        #
        #   @param cursor [String] Pagination cursor from previous response
        #
        #   @param include_info [Boolean] When set to true you may use more of your alloted API rate-limit
        #
        #   @param limit [Integer] Maximum number of results to return
        #
        #   @param status [Symbol, Cadenya::Models::Objectives::ToolCallListParams::Status] Filter by tool call status
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

        # Filter by tool call status
        module Status
          extend Cadenya::Internal::Type::Enum

          TOOL_CALL_STATUS_UNSPECIFIED = :TOOL_CALL_STATUS_UNSPECIFIED
          TOOL_CALL_STATUS_AUTO_APPROVED = :TOOL_CALL_STATUS_AUTO_APPROVED
          TOOL_CALL_STATUS_WAITING_FOR_APPROVAL = :TOOL_CALL_STATUS_WAITING_FOR_APPROVAL
          TOOL_CALL_STATUS_APPROVED = :TOOL_CALL_STATUS_APPROVED
          TOOL_CALL_STATUS_DENIED = :TOOL_CALL_STATUS_DENIED

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
