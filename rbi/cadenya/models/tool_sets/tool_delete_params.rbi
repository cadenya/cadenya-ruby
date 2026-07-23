# typed: strong

module Cadenya
  module Models
    module ToolSets
      class ToolDeleteParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ToolSets::ToolDeleteParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { params(workspace_id: String).void }
        attr_writer :workspace_id

        sig { returns(String) }
        attr_accessor :tool_set_id

        sig { returns(String) }
        attr_accessor :id

        sig do
          params(
            tool_set_id: String,
            id: String,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(tool_set_id:, id:, workspace_id: nil, request_options: {})
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              tool_set_id: String,
              id: String,
              request_options: Cadenya::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
