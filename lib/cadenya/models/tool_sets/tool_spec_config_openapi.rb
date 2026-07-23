# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      class ToolSpecConfigOpenAPI < Cadenya::Internal::Type::BaseModel
        # @!attribute openapi
        #
        #   @return [Cadenya::Models::ToolSets::ConfigOpenAPI]
        required :openapi, -> { Cadenya::ToolSets::ConfigOpenAPI }

        # @!attribute type
        #
        #   @return [Symbol, Cadenya::Models::ToolSets::ToolSpecConfigOpenAPI::Type]
        required :type, enum: -> { Cadenya::ToolSets::ToolSpecConfigOpenAPI::Type }

        # @!method initialize(openapi:, type:)
        #   @param openapi [Cadenya::Models::ToolSets::ConfigOpenAPI]
        #   @param type [Symbol, Cadenya::Models::ToolSets::ToolSpecConfigOpenAPI::Type]

        # @see Cadenya::Models::ToolSets::ToolSpecConfigOpenAPI#type
        module Type
          extend Cadenya::Internal::Type::Enum

          OPENAPI = :openapi

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
