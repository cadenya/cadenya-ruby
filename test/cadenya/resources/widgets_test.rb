# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::WidgetsTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.widgets.create(
        workspace_id: "workspaceId",
        metadata: {name: "name"},
        spec: {agentId: "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y"}
      )

    assert_pattern do
      response => Cadenya::Widget
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::WidgetSpec,
        state: Cadenya::Widget::State,
        info: Cadenya::WidgetInfo | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.widgets.retrieve("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Widget
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::WidgetSpec,
        state: Cadenya::Widget::State,
        info: Cadenya::WidgetInfo | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.widgets.update("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Widget
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::WidgetSpec,
        state: Cadenya::Widget::State,
        info: Cadenya::WidgetInfo | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.widgets.list(workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::Widget
    end

    assert_pattern do
      row => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::WidgetSpec,
        state: Cadenya::Widget::State,
        info: Cadenya::WidgetInfo | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.widgets.delete("id", workspace_id: "workspaceId")

    assert_pattern do
      response => nil
    end
  end

  def test_archive_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.widgets.archive("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Widget
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::WidgetSpec,
        state: Cadenya::Widget::State,
        info: Cadenya::WidgetInfo | nil
      }
    end
  end

  def test_unarchive_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.widgets.unarchive("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Widget
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::WidgetSpec,
        state: Cadenya::Widget::State,
        info: Cadenya::WidgetInfo | nil
      }
    end
  end
end
