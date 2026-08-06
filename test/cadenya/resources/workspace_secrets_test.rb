# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::WorkspaceSecretsTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.workspace_secrets.create(
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q",
        metadata: {name: "name"},
        spec: {}
      )

    assert_pattern do
      response => Cadenya::WorkspaceSecret
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::WorkspaceSecretSpec,
        info: Cadenya::WorkspaceSecretInfo | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.workspace_secrets.retrieve(
        "wsecret_01HXKD2E5NQM3T9AYWCF586W5A",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::WorkspaceSecret
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::WorkspaceSecretSpec,
        info: Cadenya::WorkspaceSecretInfo | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.workspace_secrets.update(
        "wsecret_01HXKD2E5NQM3T9AYWCF586W5A",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::WorkspaceSecret
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::WorkspaceSecretSpec,
        info: Cadenya::WorkspaceSecretInfo | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.workspace_secrets.list(workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::WorkspaceSecret
    end

    assert_pattern do
      row => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::WorkspaceSecretSpec,
        info: Cadenya::WorkspaceSecretInfo | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.workspace_secrets.delete(
        "wsecret_01HXKD2E5NQM3T9AYWCF586W5A",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => nil
    end
  end
end
