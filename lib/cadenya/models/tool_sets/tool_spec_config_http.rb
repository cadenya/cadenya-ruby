# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      class ToolSpecConfigHTTP < Cadenya::Internal::Type::BaseModel
        # @!attribute http
        #
        #   @return [Cadenya::Models::ToolSets::ConfigHTTP]
        required :http, -> { Cadenya::ToolSets::ConfigHTTP }

        # @!attribute type
        #
        #   @return [Symbol, Cadenya::Models::ToolSets::ToolSpecConfigHTTP::Type]
        required :type, enum: -> { Cadenya::ToolSets::ToolSpecConfigHTTP::Type }

        # @!method initialize(http:, type:)
        #   @param http [Cadenya::Models::ToolSets::ConfigHTTP]
        #   @param type [Symbol, Cadenya::Models::ToolSets::ToolSpecConfigHTTP::Type]

        # @see Cadenya::Models::ToolSets::ToolSpecConfigHTTP#type
        module Type
          extend Cadenya::Internal::Type::Enum

          HTTP = :http

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
