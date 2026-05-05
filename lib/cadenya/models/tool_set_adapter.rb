# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetAdapter < Cadenya::Internal::Type::BaseModel
      # @!attribute http
      #
      #   @return [Cadenya::Models::ToolSetAdapterHTTP, nil]
      optional :http, -> { Cadenya::ToolSetAdapterHTTP }

      # @!attribute mcp
      #
      #   @return [Cadenya::Models::ToolSetAdapterMcp, nil]
      optional :mcp, -> { Cadenya::ToolSetAdapterMcp }

      # @!method initialize(http: nil, mcp: nil)
      #   @param http [Cadenya::Models::ToolSetAdapterHTTP]
      #   @param mcp [Cadenya::Models::ToolSetAdapterMcp]
    end
  end
end
