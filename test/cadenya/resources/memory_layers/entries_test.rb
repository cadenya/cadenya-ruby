# frozen_string_literal: true

require_relative "../../test_helper"

class Cadenya::Test::Resources::MemoryLayers::EntriesTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.memory_layers.entries.create(
        "memlyr_01HXKD2E5NQM3T9AYWCFFFBMJH",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q",
        metadata: {name: "name"},
        spec: {content: "content", type: :content}
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

    response =
      @cadenya.memory_layers.entries.retrieve(
        "memlyr_01HXKD2E5NQM3T9AYWCFFFBMJH",
        "mementry_01HXKD2E5NQM3T9AYWCF5E52Z0",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
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

  def test_update_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.memory_layers.entries.update(
        "memlyr_01HXKD2E5NQM3T9AYWCFFFBMJH",
        "mementry_01HXKD2E5NQM3T9AYWCF5E52Z0",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
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

  def test_list_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.memory_layers.entries.list(
        "memlyr_01HXKD2E5NQM3T9AYWCFFFBMJH",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

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

    response =
      @cadenya.memory_layers.entries.delete(
        "memlyr_01HXKD2E5NQM3T9AYWCFFFBMJH",
        "mementry_01HXKD2E5NQM3T9AYWCF5E52Z0",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => nil
    end
  end
end
