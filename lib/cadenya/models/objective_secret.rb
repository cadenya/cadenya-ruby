# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveSecret < Cadenya::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(name: nil)
      #   @param name [String]
    end
  end
end
