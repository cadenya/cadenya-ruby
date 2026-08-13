# typed: strong

module Cadenya
  module Models
    module ToolSets
      class ToolInfo < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::ToolSets::ToolInfo, Cadenya::Internal::AnyHash)
          end

        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        sig { returns(T.nilable(Cadenya::Profile)) }
        attr_reader :created_by

        sig { params(created_by: Cadenya::Profile::OrHash).void }
        attr_writer :created_by

        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        sig { returns(T.nilable(Cadenya::ResourceMetadata)) }
        attr_reader :tool_set

        sig { params(tool_set: Cadenya::ResourceMetadata::OrHash).void }
        attr_writer :tool_set

        # Content signature identifying the tool within its tool set: a hash of the
        # sanitized llm_tool_name, description, and canonical parameters. Two tools with
        # the same llm_tool_name but different parameters or description (as MCP servers
        # may return per user) have distinct signatures.
        sig { returns(String) }
        attr_accessor :signature

        sig do
          params(
            signature: String,
            created_by: Cadenya::Profile::OrHash,
            tool_set: Cadenya::ResourceMetadata::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Content signature identifying the tool within its tool set: a hash of the
          # sanitized llm_tool_name, description, and canonical parameters. Two tools with
          # the same llm_tool_name but different parameters or description (as MCP servers
          # may return per user) have distinct signatures.
          signature:,
          # A profile identifies a user or non-human principal (such as an API key) at the
          # account level. Profiles are account-scoped and can be granted access to multiple
          # workspaces.
          created_by: nil,
          # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
          tool_set: nil
        )
        end

        sig do
          override.returns(
            {
              created_by: Cadenya::Profile,
              signature: String,
              tool_set: Cadenya::ResourceMetadata
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
