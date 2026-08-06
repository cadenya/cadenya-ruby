# frozen_string_literal: true

require_relative "../../test_helper"

class Cadenya::Test::Resources::Tenants::SubjectsTest < Cadenya::Test::ResourceTest
  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tenants.subjects.list("tenantId", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::Subject
    end

    assert_pattern do
      row => {
        metadata: Cadenya::ResourceMetadata,
        info: Cadenya::SubjectInfo | nil
      }
    end
  end
end
