# frozen_string_literal: true

require_relative "../../test_helper"

class Cadenya::Test::Resources::Agents::SchedulesTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.schedules.create(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q",
        metadata: {name: "name"},
        spec: {schedule: {}}
      )

    assert_pattern do
      response => Cadenya::Agents::AgentSchedule
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::Agents::AgentScheduleSpec,
        state: Cadenya::Agents::AgentSchedule::State,
        info: Cadenya::Agents::AgentScheduleInfo | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.schedules.retrieve(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        "as_01HXKD2E5NQM3T9AYWCFMZZZBD",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Agents::AgentSchedule
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::Agents::AgentScheduleSpec,
        state: Cadenya::Agents::AgentSchedule::State,
        info: Cadenya::Agents::AgentScheduleInfo | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.schedules.update(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        "as_01HXKD2E5NQM3T9AYWCFMZZZBD",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Agents::AgentSchedule
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::Agents::AgentScheduleSpec,
        state: Cadenya::Agents::AgentSchedule::State,
        info: Cadenya::Agents::AgentScheduleInfo | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.schedules.list(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

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
        state: Cadenya::Agents::AgentSchedule::State,
        info: Cadenya::Agents::AgentScheduleInfo | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.schedules.delete(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        "as_01HXKD2E5NQM3T9AYWCFMZZZBD",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => nil
    end
  end

  def test_archive_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.schedules.archive(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        "as_01HXKD2E5NQM3T9AYWCFMZZZBD",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Agents::AgentSchedule
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::Agents::AgentScheduleSpec,
        state: Cadenya::Agents::AgentSchedule::State,
        info: Cadenya::Agents::AgentScheduleInfo | nil
      }
    end
  end

  def test_pause_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.schedules.pause(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        "as_01HXKD2E5NQM3T9AYWCFMZZZBD",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Agents::AgentSchedule
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::Agents::AgentScheduleSpec,
        state: Cadenya::Agents::AgentSchedule::State,
        info: Cadenya::Agents::AgentScheduleInfo | nil
      }
    end
  end

  def test_resume_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.schedules.resume(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        "as_01HXKD2E5NQM3T9AYWCFMZZZBD",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Agents::AgentSchedule
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::Agents::AgentScheduleSpec,
        state: Cadenya::Agents::AgentSchedule::State,
        info: Cadenya::Agents::AgentScheduleInfo | nil
      }
    end
  end
end
