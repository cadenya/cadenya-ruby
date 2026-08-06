# typed: strong

module Cadenya
  module Models
    module Objectives
      class ToolCallSetContentParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ToolCallSetContentParams,
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

        # The content to set on the tool call. Mirrors
        # ObjectiveToolCallResult.ContentBlock but writable: media blocks carry raw data
        # on input where the result-side carries a signed url on output.
        sig do
          returns(
            T::Array[Cadenya::Objectives::SetToolCallContentRequestContentBlock]
          )
        end
        attr_accessor :content

        sig do
          params(
            objective_id: String,
            tool_call_id: String,
            content:
              T::Array[
                Cadenya::Objectives::SetToolCallContentRequestContentBlock::OrHash
              ],
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          objective_id:,
          tool_call_id:,
          # The content to set on the tool call. Mirrors
          # ObjectiveToolCallResult.ContentBlock but writable: media blocks carry raw data
          # on input where the result-side carries a signed url on output.
          content:,
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
              content:
                T::Array[
                  Cadenya::Objectives::SetToolCallContentRequestContentBlock
                ],
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
