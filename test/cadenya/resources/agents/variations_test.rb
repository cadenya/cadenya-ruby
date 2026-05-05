# frozen_string_literal: true

require_relative "../../test_helper"

class Cadenya::Test::Resources::Agents::VariationsTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.variations.create(
        "agentId",
        workspace_id: "workspaceId",
        metadata: {name: "name"},
        spec: {}
      )

    assert_pattern do
      response => Cadenya::Agents::AgentVariation
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::Agents::AgentVariationSpec,
        info: Cadenya::Agents::AgentVariationInfo | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.agents.variations.retrieve("id", workspace_id: "workspaceId", agent_id: "agentId")

    assert_pattern do
      response => Cadenya::Agents::AgentVariation
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::Agents::AgentVariationSpec,
        info: Cadenya::Agents::AgentVariationInfo | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.agents.variations.update("id", workspace_id: "workspaceId", agent_id: "agentId")

    assert_pattern do
      response => Cadenya::Agents::AgentVariation
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::Agents::AgentVariationSpec,
        info: Cadenya::Agents::AgentVariationInfo | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.agents.variations.list("agentId", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::Agents::AgentVariation
    end

    assert_pattern do
      row => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::Agents::AgentVariationSpec,
        info: Cadenya::Agents::AgentVariationInfo | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.agents.variations.delete("id", workspace_id: "workspaceId", agent_id: "agentId")

    assert_pattern do
      response => nil
    end
  end

  def test_add_assignment_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.variations.add_assignment(
        "variationId",
        workspace_id: "workspaceId",
        agent_id: "agentId"
      )

    assert_pattern do
      response => Cadenya::Agents::VariationAssignment
    end

    assert_pattern do
      response => {
        id: String | nil,
        agent: Cadenya::BareMetadata | nil,
        tool: Cadenya::BareMetadata | nil,
        tool_set: Cadenya::BareMetadata | nil
      }
    end
  end

  def test_add_memory_layer_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.variations.add_memory_layer(
        "variationId",
        workspace_id: "workspaceId",
        agent_id: "agentId"
      )

    assert_pattern do
      response => Cadenya::Agents::VariationMemoryLayerAssignment
    end

    assert_pattern do
      response => {
        id: String | nil,
        memory_layer: Cadenya::BareMetadata | nil,
        position: Integer | nil
      }
    end
  end

  def test_remove_assignment_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.variations.remove_assignment(
        "id",
        workspace_id: "workspaceId",
        agent_id: "agentId",
        variation_id: "variationId"
      )

    assert_pattern do
      response => nil
    end
  end

  def test_remove_memory_layer_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.variations.remove_memory_layer(
        "id",
        workspace_id: "workspaceId",
        agent_id: "agentId",
        variation_id: "variationId"
      )

    assert_pattern do
      response => nil
    end
  end

  def test_update_memory_layer_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.variations.update_memory_layer(
        "id",
        workspace_id: "workspaceId",
        agent_id: "agentId",
        variation_id: "variationId"
      )

    assert_pattern do
      response => Cadenya::Agents::VariationMemoryLayerAssignment
    end

    assert_pattern do
      response => {
        id: String | nil,
        memory_layer: Cadenya::BareMetadata | nil,
        position: Integer | nil
      }
    end
  end
end
