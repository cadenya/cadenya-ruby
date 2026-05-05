# typed: strong

module Cadenya
  module Models
    module ToolSets
      class ConfigHTTP < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::ToolSets::ConfigHTTP, Cadenya::Internal::AnyHash)
          end

        sig { returns(Cadenya::ToolSets::ConfigHTTP::RequestMethod::OrSymbol) }
        attr_accessor :request_method

        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :headers

        sig { params(headers: T::Hash[Symbol, String]).void }
        attr_writer :headers

        sig { returns(T.nilable(String)) }
        attr_reader :path

        sig { params(path: String).void }
        attr_writer :path

        sig { returns(T.nilable(String)) }
        attr_reader :query

        sig { params(query: String).void }
        attr_writer :query

        sig { returns(T.nilable(String)) }
        attr_reader :request_body_content_type

        sig { params(request_body_content_type: String).void }
        attr_writer :request_body_content_type

        # These are only used when the request method is a POST, PUT, or PATCH
        sig { returns(T.nilable(String)) }
        attr_reader :request_body_template

        sig { params(request_body_template: String).void }
        attr_writer :request_body_template

        # The tool name (commonly an "operation id" in OpenAPI specs) to call on the HTTP
        # adapter. This is used to match the tool spec to the correct endpoint on the HTTP
        # adapter. it will be derived from the name of the tool if not provided.
        sig { returns(T.nilable(String)) }
        attr_reader :tool_name

        sig { params(tool_name: String).void }
        attr_writer :tool_name

        sig do
          params(
            request_method:
              Cadenya::ToolSets::ConfigHTTP::RequestMethod::OrSymbol,
            headers: T::Hash[Symbol, String],
            path: String,
            query: String,
            request_body_content_type: String,
            request_body_template: String,
            tool_name: String
          ).returns(T.attached_class)
        end
        def self.new(
          request_method:,
          headers: nil,
          path: nil,
          query: nil,
          request_body_content_type: nil,
          # These are only used when the request method is a POST, PUT, or PATCH
          request_body_template: nil,
          # The tool name (commonly an "operation id" in OpenAPI specs) to call on the HTTP
          # adapter. This is used to match the tool spec to the correct endpoint on the HTTP
          # adapter. it will be derived from the name of the tool if not provided.
          tool_name: nil
        )
        end

        sig do
          override.returns(
            {
              request_method:
                Cadenya::ToolSets::ConfigHTTP::RequestMethod::OrSymbol,
              headers: T::Hash[Symbol, String],
              path: String,
              query: String,
              request_body_content_type: String,
              request_body_template: String,
              tool_name: String
            }
          )
        end
        def to_hash
        end

        module RequestMethod
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::ToolSets::ConfigHTTP::RequestMethod)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HTTP_METHOD_UNSPECIFIED =
            T.let(
              :HTTP_METHOD_UNSPECIFIED,
              Cadenya::ToolSets::ConfigHTTP::RequestMethod::TaggedSymbol
            )
          GET =
            T.let(
              :GET,
              Cadenya::ToolSets::ConfigHTTP::RequestMethod::TaggedSymbol
            )
          POST =
            T.let(
              :POST,
              Cadenya::ToolSets::ConfigHTTP::RequestMethod::TaggedSymbol
            )
          PUT =
            T.let(
              :PUT,
              Cadenya::ToolSets::ConfigHTTP::RequestMethod::TaggedSymbol
            )
          PATCH =
            T.let(
              :PATCH,
              Cadenya::ToolSets::ConfigHTTP::RequestMethod::TaggedSymbol
            )
          DELETE =
            T.let(
              :DELETE,
              Cadenya::ToolSets::ConfigHTTP::RequestMethod::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::ToolSets::ConfigHTTP::RequestMethod::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
