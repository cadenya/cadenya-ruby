# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::AccountTest < Cadenya::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @cadenya.account.retrieve

    assert_pattern do
      response => Cadenya::AccountAPI
    end

    assert_pattern do
      response => {
        info: Cadenya::AccountInfo,
        metadata: Cadenya::AccountResourceMetadata,
        spec: Cadenya::AccountSpec
      }
    end
  end

  def test_rotate_challenge_token
    skip("Mock server tests are disabled")

    response = @cadenya.account.rotate_challenge_token

    assert_pattern do
      response => Cadenya::RotateChallengeTokenResponse
    end

    assert_pattern do
      response => {
        challenge_token: String | nil
      }
    end
  end

  def test_rotate_webhook_signing_key
    skip("Mock server tests are disabled")

    response = @cadenya.account.rotate_webhook_signing_key

    assert_pattern do
      response => Cadenya::RotateWebhookSigningKeyResponse
    end

    assert_pattern do
      response => {
        webhook_events_hmac_secret: String | nil
      }
    end
  end
end
