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

        # @!method initialize(created_by: nil, tool_set: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ToolSets::ToolInfo} for more details.
        #
        #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
        #
        #   @param tool_set [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      end
    end
  end
end
