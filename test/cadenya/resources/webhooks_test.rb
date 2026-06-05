# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::WebhooksTest < Cadenya::Test::ResourceTest
  def test_unwrap
    key = "whsec_c2VjcmV0Cg=="

    webhook = StandardWebhooks::Webhook.new(key)

    data =
      "{\"data\":{\"agent\":{\"id\":\"id\",\"accountId\":\"accountId\",\"createdAt\":\"2019-12-27T18:11:19.117Z\",\"name\":\"name\",\"profileId\":\"profileId\",\"workspaceId\":\"workspaceId\",\"bundleKey\":\"bundleKey\",\"externalId\":\"externalId\",\"labels\":{\"foo\":\"string\"}},\"agentVariation\":{\"id\":\"id\",\"accountId\":\"accountId\",\"createdAt\":\"2019-12-27T18:11:19.117Z\",\"name\":\"name\",\"profileId\":\"profileId\",\"workspaceId\":\"workspaceId\",\"bundleKey\":\"bundleKey\",\"externalId\":\"externalId\",\"labels\":{\"foo\":\"string\"}},\"objective\":{\"id\":\"id\",\"accountId\":\"accountId\",\"createdAt\":\"2019-12-27T18:11:19.117Z\",\"profileId\":\"profileId\",\"workspaceId\":\"workspaceId\",\"externalId\":\"externalId\",\"labels\":{\"foo\":\"string\"}},\"objectiveEvent\":{\"data\":{\"assistantMessage\":{\"content\":\"content\",\"toolCalls\":[{\"arguments\":\"arguments\",\"functionName\":\"functionName\",\"tool\":{\"agent\":{\"id\":\"id\",\"accountId\":\"accountId\",\"createdAt\":\"2019-12-27T18:11:19.117Z\",\"name\":\"name\",\"profileId\":\"profileId\",\"workspaceId\":\"workspaceId\",\"bundleKey\":\"bundleKey\",\"externalId\":\"externalId\",\"labels\":{\"foo\":\"string\"}},\"cadenyaProvidedTool\":{\"id\":\"id\",\"accountId\":\"accountId\",\"createdAt\":\"2019-12-27T18:11:19.117Z\",\"name\":\"name\",\"profileId\":\"profileId\",\"workspaceId\":\"workspaceId\",\"bundleKey\":\"bundleKey\",\"externalId\":\"externalId\",\"labels\":{\"foo\":\"string\"}},\"tool\":{\"id\":\"id\",\"accountId\":\"accountId\",\"createdAt\":\"2019-12-27T18:11:19.117Z\",\"name\":\"name\",\"profileId\":\"profileId\",\"workspaceId\":\"workspaceId\",\"bundleKey\":\"bundleKey\",\"externalId\":\"externalId\",\"labels\":{\"foo\":\"string\"}}}}]},\"cancelled\":{\"message\":\"message\"},\"contextWindowCompacted\":{\"messagesCompacted\":0,\"newContextWindow\":{\"completionTokens\":0,\"objectiveId\":\"objectiveId\",\"previousWindowContinueInstructions\":\"previousWindowContinueInstructions\",\"promptTokens\":0,\"sequence\":0},\"strategies\":[\"string\"],\"summary\":\"summary\"},\"error\":{\"message\":\"message\",\"type\":\"type\"},\"finalized\":{\"output\":{}},\"memoryRead\":{\"memoryEntryId\":\"memoryEntryId\",\"memoryLayerId\":\"memoryLayerId\",\"message\":\"message\"},\"subAgentSpawned\":{\"agent\":{\"id\":\"id\",\"accountId\":\"accountId\",\"createdAt\":\"2019-12-27T18:11:19.117Z\",\"name\":\"name\",\"profileId\":\"profileId\",\"workspaceId\":\"workspaceId\",\"bundleKey\":\"bundleKey\",\"externalId\":\"externalId\",\"labels\":{\"foo\":\"string\"}},\"objective\":{\"id\":\"id\",\"accountId\":\"accountId\",\"createdAt\":\"2019-12-27T18:11:19.117Z\",\"profileId\":\"profileId\",\"workspaceId\":\"workspaceId\",\"externalId\":\"externalId\",\"labels\":{\"foo\":\"string\"}},\"task\":\"task\"},\"subAgentUpdated\":{\"agent\":{\"id\":\"id\",\"name\":\"name\"},\"message\":\"message\",\"objective\":{\"id\":\"id\",\"name\":\"name\"},\"status\":\"STATUS_UNSPECIFIED\"},\"toolApprovalRequested\":{\"toolCallId\":\"toolCallId\"},\"toolApproved\":{\"toolCallId\":\"toolCallId\"},\"toolCalled\":{\"toolCallId\":\"toolCallId\"},\"toolDenied\":{\"memo\":\"memo\",\"toolCallId\":\"toolCallId\"},\"toolError\":{\"message\":\"message\",\"toolCallId\":\"toolCallId\"},\"toolResult\":{\"content\":\"content\",\"toolCallId\":\"toolCallId\"},\"type\":\"type\",\"userMessage\":{\"content\":\"content\"}},\"metadata\":{\"id\":\"id\",\"accountId\":\"accountId\",\"createdAt\":\"2019-12-27T18:11:19.117Z\",\"profileId\":\"profileId\",\"workspaceId\":\"workspaceId\",\"externalId\":\"externalId\",\"labels\":{\"foo\":\"string\"}},\"contextWindowId\":\"contextWindowId\",\"info\":{\"createdBy\":{\"metadata\":{\"id\":\"id\",\"accountId\":\"accountId\",\"name\":\"name\",\"profileId\":\"profileId\",\"externalId\":\"externalId\",\"labels\":{\"foo\":\"string\"}},\"spec\":{\"type\":\"PROFILE_TYPE_UNSPECIFIED\",\"email\":\"email\",\"name\":\"name\"}},\"objective\":{\"id\":\"id\",\"accountId\":\"accountId\",\"createdAt\":\"2019-12-27T18:11:19.117Z\",\"profileId\":\"profileId\",\"workspaceId\":\"workspaceId\",\"externalId\":\"externalId\",\"labels\":{\"foo\":\"string\"}}}}},\"timestamp\":\"2019-12-27T18:11:19.117Z\",\"type\":\"type\"}"
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
