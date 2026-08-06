# frozen_string_literal: true

require_relative "../../test_helper"

class Cadenya::Test::Resources::WorkspaceAdmin::MembersTest < Cadenya::Test::ResourceTest
  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.workspace_admin.members.list(workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::WorkspaceMember
    end

    assert_pattern do
      row => {
        actor_id: String,
        profile_id: String,
        added_at: Time | nil,
        email: String | nil,
        name: String | nil
      }
    end
  end

  def test_add_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.workspace_admin.members.add(workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::WorkspaceMember
    end

    assert_pattern do
      response => {
        actor_id: String,
        profile_id: String,
        added_at: Time | nil,
        email: String | nil,
        name: String | nil
      }
    end
  end

  def test_remove_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.workspace_admin.members.remove("profileId", workspace_id: "workspaceId")

    assert_pattern do
      response => nil
    end
  end
end
