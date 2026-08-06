# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::ObjectivesTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.objectives.create(
        workspace_id: "workspaceId",
        agent_id: "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        system_prompt_data: {foo: "bar"}
      )

    assert_pattern do
      response => Cadenya::Objective
    end

    assert_pattern do
      response => {
        config_snapshot: Cadenya::ObjectiveConfigSnapshot,
        first_user_message: String,
        metadata: Cadenya::OperationMetadata,
        state: Cadenya::Objective::State,
        system_prompt: String,
        episodic_memory: Cadenya::Objective::EpisodicMemory | nil,
        first_user_message_data: ^(Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]) | nil,
        info: Cadenya::ObjectiveInfo | nil,
        memory_cascade: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::MemoryReference]) | nil,
        output: ^(Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]) | nil,
        parent_objective_id: String | nil,
        pinned_parameters: ^(Cadenya::Internal::Type::HashOf[String]) | nil,
        secrets: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::ObjectiveSecret]) | nil,
        state_message: String | nil,
        system_prompt_data: ^(Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]) | nil
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
        config_snapshot: Cadenya::ObjectiveConfigSnapshot,
        first_user_message: String,
        metadata: Cadenya::OperationMetadata,
        state: Cadenya::Objective::State,
        system_prompt: String,
        episodic_memory: Cadenya::Objective::EpisodicMemory | nil,
        first_user_message_data: ^(Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]) | nil,
        info: Cadenya::ObjectiveInfo | nil,
        memory_cascade: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::MemoryReference]) | nil,
        output: ^(Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]) | nil,
        parent_objective_id: String | nil,
        pinned_parameters: ^(Cadenya::Internal::Type::HashOf[String]) | nil,
        secrets: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::ObjectiveSecret]) | nil,
        state_message: String | nil,
        system_prompt_data: ^(Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]) | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.objectives.list(workspace_id: "workspaceId")

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
        config_snapshot: Cadenya::ObjectiveConfigSnapshot,
        first_user_message: String,
        metadata: Cadenya::OperationMetadata,
        state: Cadenya::Objective::State,
        system_prompt: String,
        episodic_memory: Cadenya::Objective::EpisodicMemory | nil,
        first_user_message_data: ^(Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]) | nil,
        info: Cadenya::ObjectiveInfo | nil,
        memory_cascade: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::MemoryReference]) | nil,
        output: ^(Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]) | nil,
        parent_objective_id: String | nil,
        pinned_parameters: ^(Cadenya::Internal::Type::HashOf[String]) | nil,
        secrets: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::ObjectiveSecret]) | nil,
        state_message: String | nil,
        system_prompt_data: ^(Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]) | nil
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
        config_snapshot: Cadenya::ObjectiveConfigSnapshot,
        first_user_message: String,
        metadata: Cadenya::OperationMetadata,
        state: Cadenya::Objective::State,
        system_prompt: String,
        episodic_memory: Cadenya::Objective::EpisodicMemory | nil,
        first_user_message_data: ^(Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]) | nil,
        info: Cadenya::ObjectiveInfo | nil,
        memory_cascade: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::MemoryReference]) | nil,
        output: ^(Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]) | nil,
        parent_objective_id: String | nil,
        pinned_parameters: ^(Cadenya::Internal::Type::HashOf[String]) | nil,
        secrets: ^(Cadenya::Internal::Type::ArrayOf[Cadenya::ObjectiveSecret]) | nil,
        state_message: String | nil,
        system_prompt_data: ^(Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]) | nil
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

    response = @cadenya.objectives.continue("objectiveId", workspace_id: "workspaceId", message: "message")

    assert_pattern do
      response => Cadenya::ObjectiveEvent
    end

    assert_pattern do
      response => {
        data: Cadenya::ObjectiveEventData,
        metadata: Cadenya::OperationMetadata,
        context_window_id: String | nil,
        duration: String | nil,
        info: Cadenya::ObjectiveEventInfo | nil,
        started_at: Time | nil
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
      row => Cadenya::ObjectiveEvent
    end

    assert_pattern do
      row => {
        data: Cadenya::ObjectiveEventData,
        metadata: Cadenya::OperationMetadata,
        context_window_id: String | nil,
        duration: String | nil,
        info: Cadenya::ObjectiveEventInfo | nil,
        started_at: Time | nil
      }
    end
  end

  def test_retrieve_diagnostics_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.objectives.retrieve_diagnostics("objectiveId", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Models::ObjectiveRetrieveDiagnosticsResponse
    end

    assert_pattern do
      response => {
        diagnostics: Cadenya::ObjectiveDiagnostics
      }
    end
  end
end
