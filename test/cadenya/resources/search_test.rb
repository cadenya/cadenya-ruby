# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::SearchTest < Cadenya::Test::ResourceTest
  def test_search_tools_or_tool_sets_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.search.search_tools_or_tool_sets(workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Models::SearchSearchToolsOrToolSetsResponse
    end

    assert_pattern do
      response => {
        agents: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::Agent]) | nil,
        tools: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::ToolSets::Tool]) | nil,
        tool_sets: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::ToolSet]) | nil
      }
    end
  end
end
