# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::WidgetSessionsTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.widget_sessions.create(
        workspace_id: "workspaceId",
        spec: {widgetId: "wgt_01HXKD2E5NQM3T9AYWCFMZZZBD"}
      )

    assert_pattern do
      response => Cadenya::WidgetSession
    end

    assert_pattern do
      response => {
        metadata: Cadenya::OperationMetadata,
        spec: Cadenya::WidgetSessionSpec,
        state: Cadenya::WidgetSession::State,
        info: Cadenya::WidgetSessionInfo | nil,
        secrets: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::WidgetSession::Secret]) | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.widget_sessions.retrieve("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::WidgetSession
    end

    assert_pattern do
      response => {
        metadata: Cadenya::OperationMetadata,
        spec: Cadenya::WidgetSessionSpec,
        state: Cadenya::WidgetSession::State,
        info: Cadenya::WidgetSessionInfo | nil,
        secrets: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::WidgetSession::Secret]) | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.widget_sessions.list(workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::WidgetSession
    end

    assert_pattern do
      row => {
        metadata: Cadenya::OperationMetadata,
        spec: Cadenya::WidgetSessionSpec,
        state: Cadenya::WidgetSession::State,
        info: Cadenya::WidgetSessionInfo | nil,
        secrets: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::WidgetSession::Secret]) | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.widget_sessions.delete("id", workspace_id: "workspaceId")

    assert_pattern do
      response => nil
    end
  end

  def test_delete_tenant_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.widget_sessions.delete_tenant(workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Models::WidgetSessionDeleteTenantResponse
    end

    assert_pattern do
      response => {
        objectives_deleted: Integer | nil,
        sessions_deleted: Integer | nil
      }
    end
  end

  def test_revoke_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.widget_sessions.revoke("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::WidgetSession
    end

    assert_pattern do
      response => {
        metadata: Cadenya::OperationMetadata,
        spec: Cadenya::WidgetSessionSpec,
        state: Cadenya::WidgetSession::State,
        info: Cadenya::WidgetSessionInfo | nil,
        secrets: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::WidgetSession::Secret]) | nil
      }
    end
  end
end
