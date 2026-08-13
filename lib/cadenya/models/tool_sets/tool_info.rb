# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      class ToolInfo < Cadenya::Internal::Type::BaseModel
        # @!attribute created_by
        #   A profile identifies a user or non-human principal (such as an API key) at the
        #   account level. Profiles are account-scoped and can be granted access to multiple
        #   workspaces.
        #
        #   @return [Cadenya::Models::Profile, nil]
        optional :created_by, -> { Cadenya::Profile }, api_name: :createdBy

        # @!attribute tool_set
        #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @return [Cadenya::Models::ResourceMetadata, nil]
        optional :tool_set, -> { Cadenya::ResourceMetadata }, api_name: :toolSet

        response_only do
          # @!attribute signature
          #   Content signature identifying the tool within its tool set: a hash of the
          #   sanitized llm_tool_name, description, and canonical parameters. Two tools with
          #   the same llm_tool_name but different parameters or description (as MCP servers
          #   may return per user) have distinct signatures.
          #
          #   @return [String]
          required :signature, String
        end

        # @!method initialize(created_by: nil, signature:, tool_set: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ToolSets::ToolInfo} for more details.
        #
        #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
        #
        #   @param signature [String] Content signature identifying the tool within its tool set: a hash of the
        #
        #   @param tool_set [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      end
    end
  end
end
