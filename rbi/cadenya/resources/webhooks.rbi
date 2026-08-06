# typed: strong

module Cadenya
  module Resources
    class Webhooks
      sig { params(payload: String).returns(Cadenya::UnsafeUnwrapWebhookEvent) }
      def unsafe_unwrap(
        # The raw webhook payload as a string
        payload
      )
      end

      sig do
        params(
          payload: String,
          headers: T::Hash[String, String],
          key: T.nilable(String)
        ).returns(Cadenya::UnwrapWebhookEvent)
      end
      def unwrap(
        # The raw webhook payload as a string
        payload,
        # The raw HTTP headers that came with the payload
        headers:,
        # The webhook signing key
        key: @client.webhook_key
      )
      end

      # @api private
      sig { params(client: Cadenya::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
