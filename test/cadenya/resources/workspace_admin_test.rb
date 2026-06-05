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
        status: Cadenya::Workspace::Status | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @cadenya.workspace_admin.retrieve("workspaceId")

    assert_pattern do
      response => Cadenya::Workspace
    end

    assert_pattern do
      response => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::WorkspaceSpec,
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
        status: Cadenya::Workspace::Status | nil
      }
    end
  end

  def test_archive
    skip("Mock server tests are disabled")

    response = @cadenya.workspace_admin.archive("workspaceId")

    assert_pattern do
      response => nil
    end
  end
end
