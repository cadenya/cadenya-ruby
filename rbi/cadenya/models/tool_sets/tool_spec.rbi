# typed: strong

module Cadenya
  module Models
    module ToolSets
      class ToolSpec < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::ToolSets::ToolSpec, Cadenya::Internal::AnyHash)
          end

        # Config defines the adapter to use for the tool. This is used to determine how
        # the tool is called. For example, if the tool is an HTTP tool, the adapter will
        # be Http. If the tool is an inline tool, the adapter will be Inline.
        sig do
          returns(
            T.any(
              Cadenya::ToolSets::ToolSpecConfigHTTP,
              Cadenya::ToolSets::ToolSpecConfigMCP,
              Cadenya::ToolSets::ToolSpecConfigOpenAPI,
              Cadenya::ToolSets::ToolSpecConfigBare
            )
          )
        end
        attr_accessor :config

        sig { returns(String) }
        attr_accessor :description

        # The tool's JSON Schema, as handed to the LLM. Required, but may be the empty
        # object `{}` for a tool that takes no arguments. Requiring it rather than
        # defaulting it means a misspelled field name (`inputSchema`, say) is a 400
        # instead of a silently parameterless tool.
        sig { returns(T::Hash[Symbol, T.anything]) }
        attr_accessor :parameters

        sig { returns(T::Boolean) }
        attr_accessor :requires_approval

        # The name provided to the LLM, which may differ from the metadata.name on the
        # tool. LLMs have specific length and format requirements, and tool set sources
        # may not comply with them, so Cadenya does its best to format names into a usable
        # format.
        sig { returns(T.nilable(String)) }
        attr_reader :llm_tool_name

        sig { params(llm_tool_name: String).void }
        attr_writer :llm_tool_name

        sig do
          params(
            config:
              T.any(
                Cadenya::ToolSets::ToolSpecConfigHTTP::OrHash,
                Cadenya::ToolSets::ToolSpecConfigMCP::OrHash,
                Cadenya::ToolSets::ToolSpecConfigOpenAPI::OrHash,
                Cadenya::ToolSets::ToolSpecConfigBare::OrHash
              ),
            description: String,
            parameters: T::Hash[Symbol, T.anything],
            requires_approval: T::Boolean,
            llm_tool_name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Config defines the adapter to use for the tool. This is used to determine how
          # the tool is called. For example, if the tool is an HTTP tool, the adapter will
          # be Http. If the tool is an inline tool, the adapter will be Inline.
          config:,
          description:,
          # The tool's JSON Schema, as handed to the LLM. Required, but may be the empty
          # object `{}` for a tool that takes no arguments. Requiring it rather than
          # defaulting it means a misspelled field name (`inputSchema`, say) is a 400
          # instead of a silently parameterless tool.
          parameters:,
          requires_approval:,
          # The name provided to the LLM, which may differ from the metadata.name on the
          # tool. LLMs have specific length and format requirements, and tool set sources
          # may not comply with them, so Cadenya does its best to format names into a usable
          # format.
          llm_tool_name: nil
        )
        end

        sig do
          override.returns(
            {
              config:
                T.any(
                  Cadenya::ToolSets::ToolSpecConfigHTTP,
                  Cadenya::ToolSets::ToolSpecConfigMCP,
                  Cadenya::ToolSets::ToolSpecConfigOpenAPI,
                  Cadenya::ToolSets::ToolSpecConfigBare
                ),
              description: String,
              parameters: T::Hash[Symbol, T.anything],
              requires_approval: T::Boolean,
              llm_tool_name: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
