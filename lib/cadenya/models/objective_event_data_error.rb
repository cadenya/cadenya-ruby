# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataError < Cadenya::Internal::Type::BaseModel
      # @!attribute error
      #
      #   @return [Cadenya::Models::ObjectiveError]
      required :error, -> { Cadenya::ObjectiveError }

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataError::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataError::Type }

      # @!method initialize(error:, type:)
      #   @param error [Cadenya::Models::ObjectiveError]
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataError::Type]

      # @see Cadenya::Models::ObjectiveEventDataError#type
      module Type
        extend Cadenya::Internal::Type::Enum

        ERROR = :error

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
