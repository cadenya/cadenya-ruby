# frozen_string_literal: true

require_relative "../../test_helper"

class Cadenya::Test::Resources::ToolSets::ToolsTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.tool_sets.tools.create(
        "toolSetId",
        workspace_id: "workspaceId",
        metadata: {name: "name"},
        spec: {config: {}, description: "description", parameters: {foo: "bar"}, requiresApproval: true}
      )

    assert_pattern do
      response => Cadenya::ToolSets::Tool
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSets::ToolSpec,
        state: Cadenya::ToolSets::Tool::State,
        info: Cadenya::ToolSets::ToolInfo | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tool_sets.tools.retrieve("toolSetId", "id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::ToolSets::Tool
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSets::ToolSpec,
        state: Cadenya::ToolSets::Tool::State,
        info: Cadenya::ToolSets::ToolInfo | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tool_sets.tools.update("toolSetId", "id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::ToolSets::Tool
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSets::ToolSpec,
        state: Cadenya::ToolSets::Tool::State,
        info: Cadenya::ToolSets::ToolInfo | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tool_sets.tools.list("toolSetId", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::ToolSets::Tool
    end

    assert_pattern do
      row => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSets::ToolSpec,
        state: Cadenya::ToolSets::Tool::State,
        info: Cadenya::ToolSets::ToolInfo | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tool_sets.tools.delete("toolSetId", "id", workspace_id: "workspaceId")

    assert_pattern do
      response => nil
    end
  end

  def test_omit_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tool_sets.tools.omit("toolSetId", "id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::ToolSets::Tool
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSets::ToolSpec,
        state: Cadenya::ToolSets::Tool::State,
        info: Cadenya::ToolSets::ToolInfo | nil
      }
    end
  end

  def test_restore_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tool_sets.tools.restore("toolSetId", "id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::ToolSets::Tool
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSets::ToolSpec,
        state: Cadenya::ToolSets::Tool::State,
        info: Cadenya::ToolSets::ToolInfo | nil
      }
    end
  end
end
