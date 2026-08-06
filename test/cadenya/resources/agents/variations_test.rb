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

    response = @cadenya.agents.variations.retrieve("agentId", "id", workspace_id: "workspaceId")

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

    response = @cadenya.agents.variations.update("agentId", "id", workspace_id: "workspaceId")

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

    response = @cadenya.agents.variations.delete("agentId", "id", workspace_id: "workspaceId")

    assert_pattern do
      response => nil
    end
  end

  def test_add_assignment_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.variations.add_assignment("agentId", "variationId", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Agents::VariationAssignment
    end

    assert_pattern do
      response => {
        id: String | nil,
        agent: Cadenya::BareMetadata | nil,
        tool: Cadenya::BareMetadata | nil,
        tool_set: Cadenya::BareMetadata | nil,
        type: String | nil
      }
    end
  end

  def test_add_memory_layer_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.variations.add_memory_layer(
        "agentId",
        "variationId",
        workspace_id: "workspaceId",
        memory_layer_id: "memlyr_01HXKD2E5NQM3T9AYWCFFFBMJH"
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
        "agentId",
        "variationId",
        "id",
        workspace_id: "workspaceId"
      )

    assert_pattern do
      response => nil
    end
  end

  def test_remove_memory_layer_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.variations.remove_memory_layer(
        "agentId",
        "variationId",
        "id",
        workspace_id: "workspaceId"
      )

    assert_pattern do
      response => nil
    end
  end

  def test_update_memory_layer_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.variations.update_memory_layer(
        "agentId",
        "variationId",
        "id",
        workspace_id: "workspaceId"
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
