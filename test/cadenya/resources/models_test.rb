# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::ModelsTest < Cadenya::Test::ResourceTest
  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.models.retrieve(
        "model_01HXKD2E5NQM3T9AYWCFKJ4GED",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Model
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ModelSpec,
        state: Cadenya::Model::State,
        info: Cadenya::Model::Info | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.models.list(workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q")

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
        state: Cadenya::Model::State,
        info: Cadenya::Model::Info | nil
      }
    end
  end

  def test_disable_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.models.disable(
        "model_01HXKD2E5NQM3T9AYWCFKJ4GED",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Model
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ModelSpec,
        state: Cadenya::Model::State,
        info: Cadenya::Model::Info | nil
      }
    end
  end

  def test_enable_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.models.enable(
        "model_01HXKD2E5NQM3T9AYWCFKJ4GED",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Model
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::ModelSpec,
        state: Cadenya::Model::State,
        info: Cadenya::Model::Info | nil
      }
    end
  end

  def test_swap_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.models.swap(workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q")

    assert_pattern do
      response => Cadenya::Internal::Type::Unknown
    end
  end
end
