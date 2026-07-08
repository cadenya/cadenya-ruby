# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::WorkspacesTest < Cadenya::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @cadenya.workspaces.list

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
end
