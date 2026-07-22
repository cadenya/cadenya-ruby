# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::WebhooksTest < Cadenya::Test::ResourceTest
  def test_unwrap
    key = "whsec_c2VjcmV0Cg=="

    webhook = StandardWebhooks::Webhook.new(key)

    data =
      "{\"data\":{\"agent\":{\"id\":\"id\",\"accountId\":\"account_01HXKD2E5NQM3T9AYWCFTJHJVF\",\"createdAt\":\"2019-12-27T18:11:19.117Z\",\"name\":\"name\",\"profileId\":\"profile_01HXKD2E5NQM3T9AYWCFS0AP08\",\"workspaceId\":\"workspace_01HXKD2E5NQM3T9AYWCF133E3Q\",\"externalId\":\"externalId\",\"labels\":{\"foo\":\"string\"},\"updatedAt\":\"2019-12-27T18:11:19.117Z\"},\"agentVariation\":{\"id\":\"id\",\"accountId\":\"account_01HXKD2E5NQM3T9AYWCFTJHJVF\",\"createdAt\":\"2019-12-27T18:11:19.117Z\",\"name\":\"name\",\"profileId\":\"profile_01HXKD2E5NQM3T9AYWCFS0AP08\",\"workspaceId\":\"workspace_01HXKD2E5NQM3T9AYWCF133E3Q\",\"externalId\":\"externalId\",\"labels\":{\"foo\":\"string\"},\"updatedAt\":\"2019-12-27T18:11:19.117Z\"},\"objective\":{\"id\":\"id\",\"accountId\":\"account_01HXKD2E5NQM3T9AYWCFTJHJVF\",\"createdAt\":\"2019-12-27T18:11:19.117Z\",\"profileId\":\"profile_01HXKD2E5NQM3T9AYWCFS0AP08\",\"workspaceId\":\"workspace_01HXKD2E5NQM3T9AYWCF133E3Q\",\"externalId\":\"externalId\",\"labels\":{\"foo\":\"string\"}},\"objectiveEvent\":{\"data\":{\"type\":\"userMessage\",\"userMessage\":{\"content\":\"content\"}},\"metadata\":{\"id\":\"id\",\"accountId\":\"account_01HXKD2E5NQM3T9AYWCFTJHJVF\",\"createdAt\":\"2019-12-27T18:11:19.117Z\",\"profileId\":\"profile_01HXKD2E5NQM3T9AYWCFS0AP08\",\"workspaceId\":\"workspace_01HXKD2E5NQM3T9AYWCF133E3Q\",\"externalId\":\"externalId\",\"labels\":{\"foo\":\"string\"}},\"contextWindowId\":\"objwin_01HXKD2E5NQM3T9AYWCFN7BSTR\",\"duration\":\"-160513s\",\"info\":{\"createdBy\":{\"metadata\":{\"id\":\"id\",\"accountId\":\"account_01HXKD2E5NQM3T9AYWCFTJHJVF\",\"name\":\"name\",\"profileId\":\"profile_01HXKD2E5NQM3T9AYWCFS0AP08\",\"createdAt\":\"2019-12-27T18:11:19.117Z\",\"externalId\":\"externalId\",\"labels\":{\"foo\":\"string\"}},\"spec\":{\"type\":\"PROFILE_TYPE_UNSPECIFIED\",\"email\":\"email\",\"name\":\"name\"}},\"objective\":{\"id\":\"id\",\"accountId\":\"account_01HXKD2E5NQM3T9AYWCFTJHJVF\",\"createdAt\":\"2019-12-27T18:11:19.117Z\",\"profileId\":\"profile_01HXKD2E5NQM3T9AYWCFS0AP08\",\"workspaceId\":\"workspace_01HXKD2E5NQM3T9AYWCF133E3Q\",\"externalId\":\"externalId\",\"labels\":{\"foo\":\"string\"}}},\"startedAt\":\"2019-12-27T18:11:19.117Z\"}},\"timestamp\":\"2019-12-27T18:11:19.117Z\",\"type\":\"type\"}"
    message_id = "1"
    timestamp = Time.now.to_i.to_s
    signature = webhook.sign(message_id, timestamp, data)
    headers =
      {"webhook-id" => message_id, "webhook-timestamp" => timestamp, "webhook-signature" => signature}

    @cadenya.webhooks.unwrap(data, headers: headers, key: key)

    bad_headers = [
      headers.merge("webhook-id" => "bad"),
      headers.merge("webhook-timestamp" => "0"),
      headers.merge("webhook-signature" => webhook.sign(message_id, timestamp, "xxx"))
    ]
    bad_headers.each do |bad_header|
      assert_raises(StandardWebhooks::WebhookVerificationError) do
        @cadenya.webhooks.unwrap(data, headers: bad_header, key: key)
      end
    end
  end
end
