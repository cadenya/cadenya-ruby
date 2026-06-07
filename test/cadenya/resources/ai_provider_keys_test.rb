# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::AIProviderKeysTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.ai_provider_keys.create("workspaceId", metadata: {name: "name"}, spec: {})

    assert_pattern do
      response => Cadenya::AIProviderKey
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::AIProviderKeySpec
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.ai_provider_keys.retrieve("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::AIProviderKey
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::AIProviderKeySpec
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.ai_provider_keys.update("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::AIProviderKey
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::AIProviderKeySpec
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @cadenya.ai_provider_keys.list("workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::AIProviderKey
    end

    assert_pattern do
      row => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::AIProviderKeySpec
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.ai_provider_keys.delete("id", workspace_id: "workspaceId")

    assert_pattern do
      response => nil
    end
  end
end
