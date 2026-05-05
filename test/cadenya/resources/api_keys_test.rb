# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::APIKeysTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.api_keys.create(metadata: {name: "name"}, spec: {})

    assert_pattern do
      response => Cadenya::APIKey
    end

    assert_pattern do
      response => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::APIKeySpec,
        info: Cadenya::APIKeyInfo | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @cadenya.api_keys.retrieve("id")

    assert_pattern do
      response => Cadenya::APIKey
    end

    assert_pattern do
      response => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::APIKeySpec,
        info: Cadenya::APIKeyInfo | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @cadenya.api_keys.update("id")

    assert_pattern do
      response => Cadenya::APIKey
    end

    assert_pattern do
      response => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::APIKeySpec,
        info: Cadenya::APIKeyInfo | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @cadenya.api_keys.list

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
        info: Cadenya::APIKeyInfo | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @cadenya.api_keys.delete("id")

    assert_pattern do
      response => nil
    end
  end

  def test_rotate
    skip("Mock server tests are disabled")

    response = @cadenya.api_keys.rotate("id")

    assert_pattern do
      response => Cadenya::APIKey
    end

    assert_pattern do
      response => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::APIKeySpec,
        info: Cadenya::APIKeyInfo | nil
      }
    end
  end
end
