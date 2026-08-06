# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::MemoryLayersTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.memory_layers.create(
        workspace_id: "workspaceId",
        metadata: {name: "name"},
        spec: {type: :MEMORY_LAYER_TYPE_UNSPECIFIED}
      )

    assert_pattern do
      response => Cadenya::MemoryLayer
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::MemoryLayerSpec,
        info: Cadenya::MemoryLayerInfo | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.memory_layers.retrieve("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::MemoryLayer
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::MemoryLayerSpec,
        info: Cadenya::MemoryLayerInfo | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.memory_layers.update("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::MemoryLayer
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::MemoryLayerSpec,
        info: Cadenya::MemoryLayerInfo | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.memory_layers.list(workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::MemoryLayer
    end

    assert_pattern do
      row => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::MemoryLayerSpec,
        info: Cadenya::MemoryLayerInfo | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.memory_layers.delete("id", workspace_id: "workspaceId")

    assert_pattern do
      response => nil
    end
  end
end
