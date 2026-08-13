# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveError < Cadenya::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(message:, type: nil)
      #   @param message [String]
      #   @param type [String]
    end
  end
end
