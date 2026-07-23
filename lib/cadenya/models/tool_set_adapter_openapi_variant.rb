# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetAdapterOpenAPIVariant < Cadenya::Internal::Type::BaseModel
      # @!attribute openapi
      #
      #   @return [Cadenya::Models::ToolSetAdapterOpenAPIURL, Cadenya::Models::ToolSetAdapterOpenAPIUploadID]
      required :openapi, union: -> { Cadenya::ToolSetAdapterOpenAPI }

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ToolSetAdapterOpenAPIVariant::Type]
      required :type, enum: -> { Cadenya::ToolSetAdapterOpenAPIVariant::Type }

      # @!method initialize(openapi:, type:)
      #   @param openapi [Cadenya::Models::ToolSetAdapterOpenAPIURL, Cadenya::Models::ToolSetAdapterOpenAPIUploadID]
      #   @param type [Symbol, Cadenya::Models::ToolSetAdapterOpenAPIVariant::Type]

      # @see Cadenya::Models::ToolSetAdapterOpenAPIVariant#type
      module Type
        extend Cadenya::Internal::Type::Enum

        OPENAPI = :openapi

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
