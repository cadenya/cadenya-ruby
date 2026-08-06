# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSetAdapter
      extend Cadenya::Internal::Type::Union

      discriminator :type

      variant :mcp, -> { Cadenya::ToolSetAdapterMCPVariant }

      variant :http, -> { Cadenya::ToolSetAdapterHTTPVariant }

      variant :openapi, -> { Cadenya::ToolSetAdapterOpenAPIVariant }

      variant :bare, -> { Cadenya::ToolSetAdapterBareVariant }

      # @!method self.variants
      #   @return [Array(Cadenya::Models::ToolSetAdapterMCPVariant, Cadenya::Models::ToolSetAdapterHTTPVariant, Cadenya::Models::ToolSetAdapterOpenAPIVariant, Cadenya::Models::ToolSetAdapterBareVariant)]
    end
  end
end
