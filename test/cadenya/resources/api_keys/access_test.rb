# frozen_string_literal: true

require_relative "../../test_helper"

class Cadenya::Test::Resources::APIKeys::AccessTest < Cadenya::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @cadenya.api_keys.access.list("id")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::Workspace
    end

    assert_pattern do
      row => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::WorkspaceSpec,
        info: Cadenya::Workspace::Info | nil,
        status: Cadenya::Workspace::Status | nil
      }
    end
  end

  def test_add
    skip("Mock server tests are disabled")

    response = @cadenya.api_keys.access.add("id")

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

  def test_remove_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.api_keys.access.remove("workspaceId", id: "id")

    assert_pattern do
      response => nil
    end
  end
end
