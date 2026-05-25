# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      class ConfigOpenAPI < Cadenya::Internal::Type::BaseModel
        # @!attribute method_
        #
        #   @return [String, nil]
        optional :method_, String, api_name: :method

        # @!attribute operation_id
        #
        #   @return [String, nil]
        optional :operation_id, String, api_name: :operationId

        # @!attribute path
        #
        #   @return [String, nil]
        optional :path, String

        # @!method initialize(method_: nil, operation_id: nil, path: nil)
        #   @param method_ [String]
        #   @param operation_id [String]
        #   @param path [String]
      end
    end
  end
end
