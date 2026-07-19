# frozen_string_literal: true

require_relative "../../test_helper"

class Cadenya::Test::Resources::Objectives::ToolsTest < Cadenya::Test::ResourceTest
  def test_list_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.objectives.tools.list(
        "obj_01HXKD2E5NQM3T9AYWCFQAZGFV",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::Objectives::ObjectiveTool
    end

    assert_pattern do
      row => {
        metadata: Cadenya::BareMetadata,
        snapshot: Cadenya::ToolSets::Tool | nil
      }
    end
  end
end
