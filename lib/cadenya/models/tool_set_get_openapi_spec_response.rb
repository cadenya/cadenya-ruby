# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::ToolSets#get_openapi_spec
    class ToolSetGetOpenAPISpecResponse < Cadenya::Internal::Type::BaseModel
      # @!attribute spec
      #   The consumed OpenAPI specification as a JSON string.
      #
      #   @return [String]
      required :spec, String

      # @!method initialize(spec:)
      #   @param spec [String] The consumed OpenAPI specification as a JSON string.
    end
  end
end
