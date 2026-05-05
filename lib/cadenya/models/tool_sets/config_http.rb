# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      class ConfigHTTP < Cadenya::Internal::Type::BaseModel
        # @!attribute request_method
        #
        #   @return [Symbol, Cadenya::Models::ToolSets::ConfigHTTP::RequestMethod]
        required :request_method,
                 enum: -> { Cadenya::ToolSets::ConfigHTTP::RequestMethod },
                 api_name: :requestMethod

        # @!attribute headers
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :headers, Cadenya::Internal::Type::HashOf[String]

        # @!attribute path
        #
        #   @return [String, nil]
        optional :path, String

        # @!attribute query
        #
        #   @return [String, nil]
        optional :query, String

        # @!attribute request_body_content_type
        #
        #   @return [String, nil]
        optional :request_body_content_type, String, api_name: :requestBodyContentType

        # @!attribute request_body_template
        #   These are only used when the request method is a POST, PUT, or PATCH
        #
        #   @return [String, nil]
        optional :request_body_template, String, api_name: :requestBodyTemplate

        # @!attribute tool_name
        #   The tool name (commonly an "operation id" in OpenAPI specs) to call on the HTTP
        #   adapter. This is used to match the tool spec to the correct endpoint on the HTTP
        #   adapter. it will be derived from the name of the tool if not provided.
        #
        #   @return [String, nil]
        optional :tool_name, String, api_name: :toolName

        # @!method initialize(request_method:, headers: nil, path: nil, query: nil, request_body_content_type: nil, request_body_template: nil, tool_name: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ToolSets::ConfigHTTP} for more details.
        #
        #   @param request_method [Symbol, Cadenya::Models::ToolSets::ConfigHTTP::RequestMethod]
        #
        #   @param headers [Hash{Symbol=>String}]
        #
        #   @param path [String]
        #
        #   @param query [String]
        #
        #   @param request_body_content_type [String]
        #
        #   @param request_body_template [String] These are only used when the request method is a POST, PUT, or PATCH
        #
        #   @param tool_name [String] The tool name (commonly an "operation id" in OpenAPI specs) to call on the HTTP

        # @see Cadenya::Models::ToolSets::ConfigHTTP#request_method
        module RequestMethod
          extend Cadenya::Internal::Type::Enum

          HTTP_METHOD_UNSPECIFIED = :HTTP_METHOD_UNSPECIFIED
          GET = :GET
          POST = :POST
          PUT = :PUT
          PATCH = :PATCH
          DELETE = :DELETE

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
