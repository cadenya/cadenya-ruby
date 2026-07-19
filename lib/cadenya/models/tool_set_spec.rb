# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetSpec < Cadenya::Internal::Type::BaseModel
      # @!attribute adapter
      #
      #   @return [Cadenya::Models::ToolSetAdapterMCPVariant, Cadenya::Models::ToolSetAdapterHTTPVariant, Cadenya::Models::ToolSetAdapterOpenAPIVariant, Cadenya::Models::ToolSetAdapterBareVariant, nil]
      optional :adapter, union: -> { Cadenya::ToolSetAdapter }

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!method initialize(adapter: nil, description: nil)
      #   @param adapter [Cadenya::Models::ToolSetAdapterMCPVariant, Cadenya::Models::ToolSetAdapterHTTPVariant, Cadenya::Models::ToolSetAdapterOpenAPIVariant, Cadenya::Models::ToolSetAdapterBareVariant]
      #   @param description [String]
    end
  end
end
