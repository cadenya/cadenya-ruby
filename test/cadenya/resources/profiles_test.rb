# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::ProfilesTest < Cadenya::Test::ResourceTest
  def test_whoami
    skip("Mock server tests are disabled")

    response = @cadenya.profiles.whoami

    assert_pattern do
      response => Cadenya::Profile
    end

    assert_pattern do
      response => {
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::ProfileSpec
      }
    end
  end
end
