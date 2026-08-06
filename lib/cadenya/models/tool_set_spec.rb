# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetSpec < Cadenya::Internal::Type::BaseModel
      # @!attribute adapter
      #
      #   @return [Cadenya::Models::ToolSetAdapter, nil]
      optional :adapter, -> { Cadenya::ToolSetAdapter }

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!method initialize(adapter: nil, description: nil)
      #   @param adapter [Cadenya::Models::ToolSetAdapter]
      #   @param description [String]
    end
  end
end
