# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::AIProviderKeysTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.ai_provider_keys.create(
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q",
        metadata: {name: "name"},
        spec: {}
      )

    assert_pattern do
      response => Cadenya::AIProviderKey
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::AIProviderKeySpec,
        info: Cadenya::AIProviderKey::Info | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.ai_provider_keys.retrieve(
        "aipk_01HXKD2E5NQM3T9AYWCFQ41VW3",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::AIProviderKey
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::AIProviderKeySpec,
        info: Cadenya::AIProviderKey::Info | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.ai_provider_keys.update(
        "aipk_01HXKD2E5NQM3T9AYWCFQ41VW3",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::AIProviderKey
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::AIProviderKeySpec,
        info: Cadenya::AIProviderKey::Info | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.ai_provider_keys.list(workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q")

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
        spec: Cadenya::AIProviderKeySpec,
        info: Cadenya::AIProviderKey::Info | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.ai_provider_keys.delete(
        "aipk_01HXKD2E5NQM3T9AYWCFQ41VW3",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => nil
    end
  end
end
