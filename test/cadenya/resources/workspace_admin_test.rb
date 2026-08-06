# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::WorkspaceAdminTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.workspace_admin.create(metadata: {name: "name"}, spec: {})

    assert_pattern do
      response => Cadenya::Workspace
    end

    assert_pattern do
      response => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::WorkspaceSpec,
        info: Cadenya::Workspace::Info | nil,
        status: Cadenya::Workspace::Status | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.workspace_admin.retrieve(workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q")

    assert_pattern do
      response => Cadenya::Workspace
    end

    assert_pattern do
      response => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::WorkspaceSpec,
        info: Cadenya::Workspace::Info | nil,
        status: Cadenya::Workspace::Status | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.workspace_admin.update(workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q")

    assert_pattern do
      response => Cadenya::Workspace
    end

    assert_pattern do
      response => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::WorkspaceSpec,
        info: Cadenya::Workspace::Info | nil,
        status: Cadenya::Workspace::Status | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @cadenya.workspace_admin.list

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

  def test_archive_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.workspace_admin.archive(workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q")

    assert_pattern do
      response => nil
    end
  end
end
