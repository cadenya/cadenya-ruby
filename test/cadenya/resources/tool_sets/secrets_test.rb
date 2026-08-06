# frozen_string_literal: true

require_relative "../../test_helper"

class Cadenya::Test::Resources::ToolSets::SecretsTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.tool_sets.secrets.create(
        "toolSetId",
        workspace_id: "workspaceId",
        metadata: {name: "name"},
        spec: {}
      )

    assert_pattern do
      response => Cadenya::ToolSets::ToolSetSecret
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSets::ToolSetSecretSpec,
        info: Cadenya::ToolSets::ToolSetSecretInfo | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tool_sets.secrets.retrieve("toolSetId", "id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::ToolSets::ToolSetSecret
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSets::ToolSetSecretSpec,
        info: Cadenya::ToolSets::ToolSetSecretInfo | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tool_sets.secrets.update("toolSetId", "id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::ToolSets::ToolSetSecret
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSets::ToolSetSecretSpec,
        info: Cadenya::ToolSets::ToolSetSecretInfo | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tool_sets.secrets.list("toolSetId", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::ToolSets::ToolSetSecret
    end

    assert_pattern do
      row => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSets::ToolSetSecretSpec,
        info: Cadenya::ToolSets::ToolSetSecretInfo | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tool_sets.secrets.delete("toolSetId", "id", workspace_id: "workspaceId")

    assert_pattern do
      response => nil
    end
  end
end
