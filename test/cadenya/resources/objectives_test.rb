# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::ObjectivesTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.objectives.create("workspaceId", agent_id: "agentId", data: {}, metadata: {})

    assert_pattern do
      response => Cadenya::Objective
    end

    assert_pattern do
      response => {
        data: Cadenya::ObjectiveData,
        metadata: Cadenya::OperationMetadata,
        status: Cadenya::ObjectiveStatus,
        info: Cadenya::ObjectiveInfo | nil,
        last_five_windows: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::ObjectiveContextWindow]) | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.objectives.retrieve("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Objective
    end

    assert_pattern do
      response => {
        data: Cadenya::ObjectiveData,
        metadata: Cadenya::OperationMetadata,
        status: Cadenya::ObjectiveStatus,
        info: Cadenya::ObjectiveInfo | nil,
        last_five_windows: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::ObjectiveContextWindow]) | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @cadenya.objectives.list("workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::Objective
    end

    assert_pattern do
      row => {
        data: Cadenya::ObjectiveData,
        metadata: Cadenya::OperationMetadata,
        status: Cadenya::ObjectiveStatus,
        info: Cadenya::ObjectiveInfo | nil,
        last_five_windows: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::ObjectiveContextWindow]) | nil
      }
    end
  end

  def test_cancel_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.objectives.cancel("objectiveId", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Objective
    end

    assert_pattern do
      response => {
        data: Cadenya::ObjectiveData,
        metadata: Cadenya::OperationMetadata,
        status: Cadenya::ObjectiveStatus,
        info: Cadenya::ObjectiveInfo | nil,
        last_five_windows: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::ObjectiveContextWindow]) | nil
      }
    end
  end

  def test_compact_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.objectives.compact("objectiveId", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Models::ObjectiveCompactResponse
    end

    assert_pattern do
      response => {
        context_window: Cadenya::ObjectiveContextWindowData | nil
      }
    end
  end

  def test_continue_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.objectives.continue("objectiveId", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Models::ObjectiveContinueResponse
    end

    assert_pattern do
      response => {
        data: Cadenya::ObjectiveEventData,
        metadata: Cadenya::OperationMetadata,
        context_window_id: String | nil,
        info: Cadenya::ObjectiveEventInfo | nil
      }
    end
  end

  def test_list_context_windows_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.objectives.list_context_windows("objectiveId", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::ObjectiveContextWindow
    end

    assert_pattern do
      row => {
        data: Cadenya::ObjectiveContextWindowData,
        metadata: Cadenya::OperationMetadata,
        info: Cadenya::ObjectiveContextWindow::Info | nil
      }
    end
  end

  def test_list_events_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.objectives.list_events("objectiveId", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::Models::ObjectiveListEventsResponse
    end

    assert_pattern do
      row => {
        data: Cadenya::ObjectiveEventData,
        metadata: Cadenya::OperationMetadata,
        context_window_id: String | nil,
        info: Cadenya::ObjectiveEventInfo | nil
      }
    end
  end
end
