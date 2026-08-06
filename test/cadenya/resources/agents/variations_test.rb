# frozen_string_literal: true

require_relative "../../test_helper"

class Cadenya::Test::Resources::Agents::VariationsTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.variations.create(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q",
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

    response =
      @cadenya.agents.variations.retrieve(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        "agentvar_01HXKD2E5NQM3T9AYWCF32BSPP",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
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

  def test_update_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.variations.update(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        "agentvar_01HXKD2E5NQM3T9AYWCF32BSPP",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
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

  def test_list_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.variations.list(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

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

    response =
      @cadenya.agents.variations.delete(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        "agentvar_01HXKD2E5NQM3T9AYWCF32BSPP",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => nil
    end
  end

  def test_add_assignment_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.variations.add_assignment(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        "agentvar_01HXKD2E5NQM3T9AYWCF32BSPP",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q",
        body: {toolId: "tool_01HXKD2E5NQM3T9AYWCFWVYY9K", type: :toolId}
      )

    assert_pattern do
      response => Cadenya::Agents::VariationAssignment
    end

    assert_pattern do
      case response
      in Cadenya::Agents::VariationAssignmentTool
      in Cadenya::Agents::VariationAssignmentToolSet
      in Cadenya::Agents::VariationAssignmentAgent
      end
    end

    assert_pattern do
      case response
      in {type: :tool, tool: Cadenya::BareMetadata, id: String | nil}
      in {type: :toolSet, tool_set: Cadenya::BareMetadata, id: String | nil}
      in {type: :agent, agent: Cadenya::BareMetadata, id: String | nil}
      end
    end
  end

  def test_add_memory_layer_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.variations.add_memory_layer(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        "agentvar_01HXKD2E5NQM3T9AYWCF32BSPP",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q",
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
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        "agentvar_01HXKD2E5NQM3T9AYWCF32BSPP",
        "avt_01HXKD2E5NQM3T9AYWCFJE6K89",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => nil
    end
  end

  def test_remove_memory_layer_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.variations.remove_memory_layer(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        "agentvar_01HXKD2E5NQM3T9AYWCF32BSPP",
        "avml_01HXKD2E5NQM3T9AYWCFX8AF59",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => nil
    end
  end

  def test_update_memory_layer_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.agents.variations.update_memory_layer(
        "agent_01HXKD2E5NQM3T9AYWCFMGWT9Y",
        "agentvar_01HXKD2E5NQM3T9AYWCF32BSPP",
        "avml_01HXKD2E5NQM3T9AYWCFX8AF59",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
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
