# frozen_string_literal: true

require_relative "../../test_helper"

class Cadenya::Test::Resources::Agents::SchedulesTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.schedules.create(
        "agentId",
        workspace_id: "workspaceId",
        metadata: {name: "name"},
        spec: {initialMessage: "initialMessage", schedule: {}}
      )

    assert_pattern do
      response => Cadenya::Agents::AgentSchedule
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::Agents::AgentScheduleSpec,
        info: Cadenya::Agents::AgentScheduleInfo | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.agents.schedules.retrieve("id", workspace_id: "workspaceId", agent_id: "agentId")

    assert_pattern do
      response => Cadenya::Agents::AgentSchedule
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::Agents::AgentScheduleSpec,
        info: Cadenya::Agents::AgentScheduleInfo | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.agents.schedules.update("id", workspace_id: "workspaceId", agent_id: "agentId")

    assert_pattern do
      response => Cadenya::Agents::AgentSchedule
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::Agents::AgentScheduleSpec,
        info: Cadenya::Agents::AgentScheduleInfo | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.agents.schedules.list("agentId", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::Agents::AgentSchedule
    end

    assert_pattern do
      row => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::Agents::AgentScheduleSpec,
        info: Cadenya::Agents::AgentScheduleInfo | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.agents.schedules.delete("id", workspace_id: "workspaceId", agent_id: "agentId")

    assert_pattern do
      response => nil
    end
  end
end
