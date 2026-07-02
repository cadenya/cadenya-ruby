# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      class ToolSpecConfig < Cadenya::Internal::Type::BaseModel
        # @!attribute http
        #
        #   @return [Cadenya::Models::ToolSets::ConfigHTTP, nil]
        optional :http, -> { Cadenya::ToolSets::ConfigHTTP }

        # @!attribute mcp
        #
        #   @return [Cadenya::Models::ToolSets::ConfigMcp, nil]
        optional :mcp, -> { Cadenya::ToolSets::ConfigMcp }

        # @!attribute openapi
        #
        #   @return [Cadenya::Models::ToolSets::ConfigOpenAPI, nil]
        optional :openapi, -> { Cadenya::ToolSets::ConfigOpenAPI }

        # @!method initialize(http: nil, mcp: nil, openapi: nil)
        #   Config defines the adapter to use for the tool. This is used to determine how
        #   the tool is called. For example, if the tool is an HTTP tool, the adapter will
        #   be Http. If the tool is an inline tool, the adapter will be Inline.
        #
        #   @param http [Cadenya::Models::ToolSets::ConfigHTTP]
        #   @param mcp [Cadenya::Models::ToolSets::ConfigMcp]
        #   @param openapi [Cadenya::Models::ToolSets::ConfigOpenAPI]
      end
    end
  end
end
