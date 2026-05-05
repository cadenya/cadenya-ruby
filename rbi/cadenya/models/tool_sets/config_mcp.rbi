# typed: strong

module Cadenya
  module Models
    module ToolSets
      class ConfigMcp < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::ToolSets::ConfigMcp, Cadenya::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_reader :tool_description

        sig { params(tool_description: String).void }
        attr_writer :tool_description

        sig { returns(T.nilable(String)) }
        attr_reader :tool_name

        sig { params(tool_name: String).void }
        attr_writer :tool_name

        sig { returns(T.nilable(String)) }
        attr_reader :tool_title

        sig { params(tool_title: String).void }
        attr_writer :tool_title

        sig do
          params(
            tool_description: String,
            tool_name: String,
            tool_title: String
          ).returns(T.attached_class)
        end
        def self.new(tool_description: nil, tool_name: nil, tool_title: nil)
        end

        sig do
          override.returns(
            { tool_description: String, tool_name: String, tool_title: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
