# frozen_string_literal: true

require_relative "../../test_helper"

class Cadenya::Test::Resources::Objectives::TasksTest < Cadenya::Test::ResourceTest
  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.objectives.tasks.retrieve(
        "obj_01HXKD2E5NQM3T9AYWCFQAZGFV",
        "id",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Objectives::ObjectiveTask
    end

    assert_pattern do
      response => {
        data: Cadenya::Objectives::ObjectiveTaskData,
        metadata: Cadenya::BareMetadata
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.objectives.tasks.list(
        "obj_01HXKD2E5NQM3T9AYWCFQAZGFV",
        workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q"
      )

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::Objectives::ObjectiveTask
    end

    assert_pattern do
      row => {
        data: Cadenya::Objectives::ObjectiveTaskData,
        metadata: Cadenya::BareMetadata
      }
    end
  end
end
