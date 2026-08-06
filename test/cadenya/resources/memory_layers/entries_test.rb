# frozen_string_literal: true

require_relative "../../test_helper"

class Cadenya::Test::Resources::MemoryLayers::EntriesTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.memory_layers.entries.create(
        "memoryLayerId",
        workspace_id: "workspaceId",
        metadata: {name: "name"},
        spec: {key: "key"}
      )

    assert_pattern do
      response => Cadenya::MemoryLayers::MemoryEntryDetail
    end

    assert_pattern do
      response => {
        content: String,
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::MemoryLayers::MemoryEntrySpec,
        info: Cadenya::MemoryLayers::MemoryEntryInfo | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.memory_layers.entries.retrieve("memoryLayerId", "id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::MemoryLayers::MemoryEntryDetail
    end

    assert_pattern do
      response => {
        content: String,
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::MemoryLayers::MemoryEntrySpec,
        info: Cadenya::MemoryLayers::MemoryEntryInfo | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.memory_layers.entries.update("memoryLayerId", "id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::MemoryLayers::MemoryEntryDetail
    end

    assert_pattern do
      response => {
        content: String,
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::MemoryLayers::MemoryEntrySpec,
        info: Cadenya::MemoryLayers::MemoryEntryInfo | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.memory_layers.entries.list("memoryLayerId", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::MemoryLayers::MemoryEntry
    end

    assert_pattern do
      row => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::MemoryLayers::MemoryEntrySpec,
        info: Cadenya::MemoryLayers::MemoryEntryInfo | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.memory_layers.entries.delete("memoryLayerId", "id", workspace_id: "workspaceId")

    assert_pattern do
      response => nil
    end
  end
end
