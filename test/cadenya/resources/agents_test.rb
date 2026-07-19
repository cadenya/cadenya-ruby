# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::AgentsTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.create(
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q",
        metadata: {name: "name"},
        spec: {variationSelectionMode: :VARIATION_SELECTION_MODE_UNSPECIFIED}
      )

    assert_pattern do
      response => Cadenya::Agent
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::AgentSpec,
        state: Cadenya::Agent::State,
        info: Cadenya::AgentInfo | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.retrieve(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Agent
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::AgentSpec,
        state: Cadenya::Agent::State,
        info: Cadenya::AgentInfo | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.update(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Agent
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::AgentSpec,
        state: Cadenya::Agent::State,
        info: Cadenya::AgentInfo | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.agents.list(workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::Agent
    end

    assert_pattern do
      row => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::AgentSpec,
        state: Cadenya::Agent::State,
        info: Cadenya::AgentInfo | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.delete(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => nil
    end
  end

  def test_archive_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.archive(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Agent
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::AgentSpec,
        state: Cadenya::Agent::State,
        info: Cadenya::AgentInfo | nil
      }
    end
  end

  def test_publish_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.publish(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Agent
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::AgentSpec,
        state: Cadenya::Agent::State,
        info: Cadenya::AgentInfo | nil
      }
    end
  end

  def test_unarchive_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.unarchive(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Agent
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::AgentSpec,
        state: Cadenya::Agent::State,
        info: Cadenya::AgentInfo | nil
      }
    end
  end

  def test_unpublish_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.unpublish(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Agent
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::AgentSpec,
        state: Cadenya::Agent::State,
        info: Cadenya::AgentInfo | nil
      }
    end
  end
end
