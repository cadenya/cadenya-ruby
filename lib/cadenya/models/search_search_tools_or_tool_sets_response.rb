# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Search#search_tools_or_tool_sets
    class SearchSearchToolsOrToolSetsResponse < Cadenya::Internal::Type::BaseModel
      # @!attribute agents
      #
      #   @return [Array<Cadenya::Models::Agent>, nil]
      optional :agents, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::Agent] }

      # @!attribute tools
      #
      #   @return [Array<Cadenya::Models::ToolSets::Tool>, nil]
      optional :tools, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::ToolSets::Tool] }

      # @!attribute tool_sets
      #
      #   @return [Array<Cadenya::Models::ToolSet>, nil]
      optional :tool_sets, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::ToolSet] }, api_name: :toolSets

      # @!method initialize(agents: nil, tools: nil, tool_sets: nil)
      #   @param agents [Array<Cadenya::Models::Agent>]
      #   @param tools [Array<Cadenya::Models::ToolSets::Tool>]
      #   @param tool_sets [Array<Cadenya::Models::ToolSet>]
    end
  end
end
