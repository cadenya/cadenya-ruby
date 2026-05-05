# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      class ConfigMcp < Cadenya::Internal::Type::BaseModel
        # @!attribute tool_description
        #
        #   @return [String, nil]
        optional :tool_description, String, api_name: :toolDescription

        # @!attribute tool_name
        #
        #   @return [String, nil]
        optional :tool_name, String, api_name: :toolName

        # @!attribute tool_title
        #
        #   @return [String, nil]
        optional :tool_title, String, api_name: :toolTitle

        # @!method initialize(tool_description: nil, tool_name: nil, tool_title: nil)
        #   @param tool_description [String]
        #   @param tool_name [String]
        #   @param tool_title [String]
      end
    end
  end
end
