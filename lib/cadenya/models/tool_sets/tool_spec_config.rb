# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      class ToolSpecConfig < Cadenya::Internal::Type::BaseModel
        # @!attribute bare
        #   Marks the tool as bare: it has no execution adapter of its own and relies on the
        #   parent tool set being a Bare tool set. Present so a webhook consumer can tell a
        #   tool is bare from the tool data alone, without cross-referencing the tool set.
        #
        #   @return [Cadenya::Models::ToolSets::ConfigBare, nil]
        optional :bare, -> { Cadenya::ToolSets::ConfigBare }

        # @!attribute http
        #
        #   @return [Cadenya::Models::ToolSets::ConfigHTTP, nil]
        optional :http, -> { Cadenya::ToolSets::ConfigHTTP }

        # @!attribute mcp
        #
        #   @return [Cadenya::Models::ToolSets::ConfigMCP, nil]
        optional :mcp, -> { Cadenya::ToolSets::ConfigMCP }

        # @!attribute openapi
        #
        #   @return [Cadenya::Models::ToolSets::ConfigOpenAPI, nil]
        optional :openapi, -> { Cadenya::ToolSets::ConfigOpenAPI }

        # @!attribute type
        #   The JSON name of the variant set in `adapter` (e.g. "http"). Required from
        #   clients on writes, filled by the server on reads; drives the discriminated union
        #   in the generated OpenAPI.
        #
        #   @return [String, nil]
        optional :type, String

        # @!method initialize(bare: nil, http: nil, mcp: nil, openapi: nil, type: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ToolSets::ToolSpecConfig} for more details.
        #
        #   Config defines the adapter to use for the tool. This is used to determine how
        #   the tool is called. For example, if the tool is an HTTP tool, the adapter will
        #   be Http. If the tool is an inline tool, the adapter will be Inline.
        #
        #   @param bare [Cadenya::Models::ToolSets::ConfigBare] Marks the tool as bare: it has no execution adapter of its own and
        #
        #   @param http [Cadenya::Models::ToolSets::ConfigHTTP]
        #
        #   @param mcp [Cadenya::Models::ToolSets::ConfigMCP]
        #
        #   @param openapi [Cadenya::Models::ToolSets::ConfigOpenAPI]
        #
        #   @param type [String] The JSON name of the variant set in `adapter` (e.g. "http"). Required
      end
    end
  end
end
