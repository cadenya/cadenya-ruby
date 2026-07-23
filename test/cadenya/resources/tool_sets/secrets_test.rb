# frozen_string_literal: true

require_relative "../../test_helper"

class Cadenya::Test::Resources::ToolSets::SecretsTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.tool_sets.secrets.create(
        "toolset_01HXKD2E5NQM3T9AYWCFNRMN74",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q",
        metadata: {name: "name"},
        spec: {}
      )

    assert_pattern do
      response => Cadenya::ToolSets::ToolSetSecret
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSets::ToolSetSecretSpec,
        info: Cadenya::ToolSets::ToolSetSecretInfo | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.tool_sets.secrets.retrieve(
        "toolset_01HXKD2E5NQM3T9AYWCFNRMN74",
        "toolsecret_01HXKD2E5NQM3T9AYWCF8PWC4R",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::ToolSets::ToolSetSecret
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSets::ToolSetSecretSpec,
        info: Cadenya::ToolSets::ToolSetSecretInfo | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.tool_sets.secrets.update(
        "toolset_01HXKD2E5NQM3T9AYWCFNRMN74",
        "toolsecret_01HXKD2E5NQM3T9AYWCF8PWC4R",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::ToolSets::ToolSetSecret
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSets::ToolSetSecretSpec,
        info: Cadenya::ToolSets::ToolSetSecretInfo | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.tool_sets.secrets.list(
        "toolset_01HXKD2E5NQM3T9AYWCFNRMN74",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::ToolSets::ToolSetSecret
    end

    assert_pattern do
      row => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ToolSets::ToolSetSecretSpec,
        info: Cadenya::ToolSets::ToolSetSecretInfo | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.tool_sets.secrets.delete(
        "toolset_01HXKD2E5NQM3T9AYWCFNRMN74",
        "toolsecret_01HXKD2E5NQM3T9AYWCF8PWC4R",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => nil
    end
  end
end
