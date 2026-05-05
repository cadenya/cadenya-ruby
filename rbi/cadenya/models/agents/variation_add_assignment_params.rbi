# typed: strong

module Cadenya
  module Models
    module Agents
      class VariationAddAssignmentParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::VariationAddAssignmentParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        sig { returns(String) }
        attr_accessor :agent_id

        sig { returns(String) }
        attr_accessor :variation_id

        sig { returns(T.nilable(String)) }
        attr_reader :sub_agent_id

        sig { params(sub_agent_id: String).void }
        attr_writer :sub_agent_id

        sig { returns(T.nilable(String)) }
        attr_reader :tool_id

        sig { params(tool_id: String).void }
        attr_writer :tool_id

        sig { returns(T.nilable(String)) }
        attr_reader :tool_set_id

        sig { params(tool_set_id: String).void }
        attr_writer :tool_set_id

        sig do
          params(
            workspace_id: String,
            agent_id: String,
            variation_id: String,
            sub_agent_id: String,
            tool_id: String,
            tool_set_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          workspace_id:,
          agent_id:,
          variation_id:,
          sub_agent_id: nil,
          tool_id: nil,
          tool_set_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              agent_id: String,
              variation_id: String,
              sub_agent_id: String,
              tool_id: String,
              tool_set_id: String,
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
