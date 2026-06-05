# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::ProfilesTest < Cadenya::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @cadenya.profiles.list

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::Profile
    end

    assert_pattern do
      row => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::ProfileSpec
      }
    end
  end
end
