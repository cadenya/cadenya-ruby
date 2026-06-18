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
        sig { returns(Cadenya::ToolSets::ToolSpecConfig) }
        attr_reader :config

        sig { params(config: Cadenya::ToolSets::ToolSpecConfig::OrHash).void }
        attr_writer :config

        sig { returns(String) }
        attr_accessor :description

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
            config: Cadenya::ToolSets::ToolSpecConfig::OrHash,
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
              config: Cadenya::ToolSets::ToolSpecConfig,
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
