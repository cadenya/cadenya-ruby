# frozen_string_literal: true

require_relative "../../test_helper"

class Cadenya::Test::Resources::BulkWorkspaceResources::ResultsTest < Cadenya::Test::ResourceTest
  def test_list_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.bulk_workspace_resources.results.list("bulkWorkspaceApplyId", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResult
    end

    assert_pattern do
      row => {
        data: Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultData,
        metadata: Cadenya::OperationMetadata
      }
    end
  end
end
