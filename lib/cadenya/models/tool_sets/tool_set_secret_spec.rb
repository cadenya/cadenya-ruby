# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      class ToolSetSecretSpec < Cadenya::Internal::Type::BaseModel
        # @!attribute value
        #
        #   @return [String, nil]
        optional :value, String

        # @!method initialize(value: nil)
        #   @param value [String]
      end
    end

    ToolSetSecretSpec = ToolSets::ToolSetSecretSpec
  end
end
