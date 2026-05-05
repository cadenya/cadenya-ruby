# frozen_string_literal: true

module Cadenya
  module Models
    class WorkspaceSpec < Cadenya::Internal::Type::BaseModel
      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!method initialize(description: nil)
      #   @param description [String]
    end
  end
end
