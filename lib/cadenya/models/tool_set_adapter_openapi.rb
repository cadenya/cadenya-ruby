# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetAdapterOpenAPI < Cadenya::Internal::Type::BaseModel
      # @!attribute base_url
      #   Base URL for dispatching tool calls. If set, overrides the server resolved from
      #   the spec's servers array.
      #
      #   @return [String, nil]
      optional :base_url, String, api_name: :baseUrl

      # @!attribute exclude_tools
      #   Top-level filter with simple boolean logic (no nesting)
      #
      #   @return [Cadenya::Models::ToolFilter, nil]
      optional :exclude_tools, -> { Cadenya::ToolFilter }, api_name: :excludeTools

      # @!attribute headers
      #   Headers sent when fetching the spec from a URL and when dispatching tool calls.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, Cadenya::Internal::Type::HashOf[String]

      # @!attribute include_tools
      #   Top-level filter with simple boolean logic (no nesting)
      #
      #   @return [Cadenya::Models::ToolFilter, nil]
      optional :include_tools, -> { Cadenya::ToolFilter }, api_name: :includeTools

      # @!attribute server_name
      #   Name of the server entry in the spec's servers array (OpenAPI 3.2 server.name
      #   field). Used to select which server URL to dispatch to when base_url is not set.
      #   If unset, the first server is used. Ignored when base_url is set.
      #
      #   @return [String, nil]
      optional :server_name, String, api_name: :serverName

      # @!attribute tool_approvals
      #   Approval filters that will automatically set the approval requirement on tools
      #   synced from an external source
      #
      #   @return [Cadenya::Models::ApprovalRequirementFilter, nil]
      optional :tool_approvals, -> { Cadenya::ApprovalRequirementFilter }, api_name: :toolApprovals

      # @!attribute type
      #   The JSON name of the variant set in `source` (e.g. "url"). Required from clients
      #   on writes, filled by the server on reads; drives the discriminated union in the
      #   generated OpenAPI.
      #
      #   @return [String, nil]
      optional :type, String

      # @!attribute upload_id
      #   ID of a COMPLETE Upload containing the OpenAPI spec document.
      #
      #   @return [String, nil]
      optional :upload_id, String, api_name: :uploadId

      # @!attribute url
      #   URL to fetch the OpenAPI spec from. Synced automatically every hour.
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(base_url: nil, exclude_tools: nil, headers: nil, include_tools: nil, server_name: nil, tool_approvals: nil, type: nil, upload_id: nil, url: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolSetAdapterOpenAPI} for more details.
      #
      #   @param base_url [String] Base URL for dispatching tool calls. If set, overrides the server
      #
      #   @param exclude_tools [Cadenya::Models::ToolFilter] Top-level filter with simple boolean logic (no nesting)
      #
      #   @param headers [Hash{Symbol=>String}] Headers sent when fetching the spec from a URL and when dispatching tool calls.
      #
      #   @param include_tools [Cadenya::Models::ToolFilter] Top-level filter with simple boolean logic (no nesting)
      #
      #   @param server_name [String] Name of the server entry in the spec's servers array (OpenAPI 3.2
      #
      #   @param tool_approvals [Cadenya::Models::ApprovalRequirementFilter] Approval filters that will automatically set the approval requirement on tools s
      #
      #   @param type [String] The JSON name of the variant set in `source` (e.g. "url"). Required
      #
      #   @param upload_id [String] ID of a COMPLETE Upload containing the OpenAPI spec document.
      #
      #   @param url [String] URL to fetch the OpenAPI spec from. Synced automatically every hour.
    end
  end
end
