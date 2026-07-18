# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::GlobalAPIKeyTest < Cadenya::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @cadenya.global_api_key.retrieve

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

  def test_disable
    skip("Mock server tests are disabled")

    response = @cadenya.global_api_key.disable

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

  def test_enable
    skip("Mock server tests are disabled")

    response = @cadenya.global_api_key.enable

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

  def test_rotate
    skip("Mock server tests are disabled")

    response = @cadenya.global_api_key.rotate

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
