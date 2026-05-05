# frozen_string_literal: true

module Cadenya
  module Models
    class WorkspaceSecretSpec < Cadenya::Internal::Type::BaseModel
      # @!attribute value
      #
      #   @return [String, nil]
      optional :value, String

      # @!method initialize(value: nil)
      #   @param value [String]
    end
  end
end
