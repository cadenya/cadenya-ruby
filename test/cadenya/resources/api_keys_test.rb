# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::APIKeysTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.api_keys.create(workspace_id: "workspaceId", metadata: {name: "name"}, spec: {})

    assert_pattern do
      response => Cadenya::APIKey
    end

    assert_pattern do
      response => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::APIKeySpec,
        state: Cadenya::APIKey::State,
        info: Cadenya::APIKeyInfo | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.api_keys.retrieve("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::APIKey
    end

    assert_pattern do
      response => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::APIKeySpec,
        state: Cadenya::APIKey::State,
        info: Cadenya::APIKeyInfo | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.api_keys.update("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::APIKey
    end

    assert_pattern do
      response => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::APIKeySpec,
        state: Cadenya::APIKey::State,
        info: Cadenya::APIKeyInfo | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.api_keys.list(workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::APIKey
    end

    assert_pattern do
      row => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::APIKeySpec,
        state: Cadenya::APIKey::State,
        info: Cadenya::APIKeyInfo | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.api_keys.delete("id", workspace_id: "workspaceId")

    assert_pattern do
      response => nil
    end
  end

  def test_disable_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.api_keys.disable("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::APIKey
    end

    assert_pattern do
      response => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::APIKeySpec,
        state: Cadenya::APIKey::State,
        info: Cadenya::APIKeyInfo | nil
      }
    end
  end

  def test_enable_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.api_keys.enable("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::APIKey
    end

    assert_pattern do
      response => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::APIKeySpec,
        state: Cadenya::APIKey::State,
        info: Cadenya::APIKeyInfo | nil
      }
    end
  end

  def test_rotate_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.api_keys.rotate("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::APIKey
    end

    assert_pattern do
      response => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::APIKeySpec,
        state: Cadenya::APIKey::State,
        info: Cadenya::APIKeyInfo | nil
      }
    end
  end
end
