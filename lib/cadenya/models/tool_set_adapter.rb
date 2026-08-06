# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetAdapter < Cadenya::Internal::Type::BaseModel
      # @!attribute bare
      #   Bare tool sets define tools without an execution adapter. A bare tool call
      #   doesn't fire anything: the objective's workflow pauses and waits for an external
      #   API consumer to set the tool call's content (e.g. human-in-the-loop tools, or a
      #   reverse harness that polls for pending tool calls, executes locally, and reports
      #   results back via SetToolCallContent).
      #
      #   @return [Cadenya::Models::ToolSetAdapterBare, nil]
      optional :bare, -> { Cadenya::ToolSetAdapterBare }

      # @!attribute http
      #
      #   @return [Cadenya::Models::ToolSetAdapterHTTP, nil]
      optional :http, -> { Cadenya::ToolSetAdapterHTTP }

      # @!attribute mcp
      #
      #   @return [Cadenya::Models::ToolSetAdapterMCP, nil]
      optional :mcp, -> { Cadenya::ToolSetAdapterMCP }

      # @!attribute openapi
      #
      #   @return [Cadenya::Models::ToolSetAdapterOpenAPI, nil]
      optional :openapi, -> { Cadenya::ToolSetAdapterOpenAPI }

      # @!attribute type
      #   The JSON name of the variant set in `adapter` (e.g. "mcp"). Required from
      #   clients on writes, filled by the server on reads; drives the discriminated union
      #   in the generated OpenAPI.
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(bare: nil, http: nil, mcp: nil, openapi: nil, type: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolSetAdapter} for more details.
      #
      #   @param bare [Cadenya::Models::ToolSetAdapterBare] Bare tool sets define tools without an execution adapter. A bare tool
      #
      #   @param http [Cadenya::Models::ToolSetAdapterHTTP]
      #
      #   @param mcp [Cadenya::Models::ToolSetAdapterMCP]
      #
      #   @param openapi [Cadenya::Models::ToolSetAdapterOpenAPI]
      #
      #   @param type [String] The JSON name of the variant set in `adapter` (e.g. "mcp"). Required
    end
  end
end
