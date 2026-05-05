# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::ToolSetsTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tool_sets.create("workspaceId", metadata: {name: "name"}, spec: {})

    assert_pattern do
      response => Cadenya::ToolSet
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSetSpec,
        info: Cadenya::ToolSetInfo | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tool_sets.retrieve("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::ToolSet
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSetSpec,
        info: Cadenya::ToolSetInfo | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tool_sets.update("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::ToolSet
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSetSpec,
        info: Cadenya::ToolSetInfo | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @cadenya.tool_sets.list("workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::ToolSet
    end

    assert_pattern do
      row => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSetSpec,
        info: Cadenya::ToolSetInfo | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tool_sets.delete("id", workspace_id: "workspaceId")

    assert_pattern do
      response => nil
    end
  end

  def test_list_events_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tool_sets.list_events("toolSetId", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::ToolSetEvent
    end

    assert_pattern do
      row => {
        metadata: Cadenya::OperationMetadata,
        event: Cadenya::ToolSetEventData | nil,
        info: Cadenya::ToolSetEvent::Info | nil,
        tool_set_id: String | nil
      }
    end
  end
end
