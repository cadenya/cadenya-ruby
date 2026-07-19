# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetAdapterHTTPVariant < Cadenya::Internal::Type::BaseModel
      # @!attribute http
      #
      #   @return [Cadenya::Models::ToolSetAdapterHTTP]
      required :http, -> { Cadenya::ToolSetAdapterHTTP }

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ToolSetAdapterHTTPVariant::Type]
      required :type, enum: -> { Cadenya::ToolSetAdapterHTTPVariant::Type }

      # @!method initialize(http:, type:)
      #   @param http [Cadenya::Models::ToolSetAdapterHTTP]
      #   @param type [Symbol, Cadenya::Models::ToolSetAdapterHTTPVariant::Type]

      # @see Cadenya::Models::ToolSetAdapterHTTPVariant#type
      module Type
        extend Cadenya::Internal::Type::Enum

        HTTP = :http

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
