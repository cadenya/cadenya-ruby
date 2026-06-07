# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::ModelsTest < Cadenya::Test::ResourceTest
  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.models.retrieve("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Model
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ModelSpec,
        info: Cadenya::Model::Info | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @cadenya.models.list("workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::Model
    end

    assert_pattern do
      row => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ModelSpec,
        info: Cadenya::Model::Info | nil
      }
    end
  end

  def test_set_status_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.models.set_status("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Model
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ModelSpec,
        info: Cadenya::Model::Info | nil
      }
    end
  end
end
