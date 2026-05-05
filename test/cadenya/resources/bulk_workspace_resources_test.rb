# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::BulkWorkspaceResourcesTest < Cadenya::Test::ResourceTest
  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.bulk_workspace_resources.retrieve("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::BulkWorkspaceApply
    end

    assert_pattern do
      response => {
        data: Cadenya::BulkWorkspaceApplyData,
        metadata: Cadenya::OperationMetadata,
        status: Cadenya::BulkWorkspaceApplyStatus,
        info: Cadenya::BulkWorkspaceApplyInfo | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @cadenya.bulk_workspace_resources.list("workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::BulkWorkspaceApply
    end

    assert_pattern do
      row => {
        data: Cadenya::BulkWorkspaceApplyData,
        metadata: Cadenya::OperationMetadata,
        status: Cadenya::BulkWorkspaceApplyStatus,
        info: Cadenya::BulkWorkspaceApplyInfo | nil
      }
    end
  end

  def test_apply_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.bulk_workspace_resources.apply("workspaceId", data: {bundleKey: "bundleKey"})

    assert_pattern do
      response => Cadenya::BulkWorkspaceApply
    end

    assert_pattern do
      response => {
        data: Cadenya::BulkWorkspaceApplyData,
        metadata: Cadenya::OperationMetadata,
        status: Cadenya::BulkWorkspaceApplyStatus,
        info: Cadenya::BulkWorkspaceApplyInfo | nil
      }
    end
  end
end
