# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveDataSecret < Cadenya::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute value
      #
      #   @return [String, nil]
      optional :value, String

      # @!method initialize(name: nil, value: nil)
      #   @param name [String]
      #   @param value [String]
    end
  end
end
