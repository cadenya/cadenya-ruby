# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveSecret < Cadenya::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!method initialize(name:)
      #   @param name [String]
    end
  end
end
