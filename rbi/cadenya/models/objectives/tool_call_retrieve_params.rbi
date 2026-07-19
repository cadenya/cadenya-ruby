# typed: strong

module Cadenya
  module Models
    module Objectives
      class ToolCallRetrieveParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ToolCallRetrieveParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { params(workspace_id: String).void }
        attr_writer :workspace_id

        sig { returns(String) }
        attr_accessor :objective_id

        sig { returns(String) }
        attr_accessor :tool_call_id

        sig do
          params(
            objective_id: String,
            tool_call_id: String,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          objective_id:,
          tool_call_id:,
          workspace_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              objective_id: String,
              tool_call_id: String,
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
