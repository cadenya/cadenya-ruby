# typed: strong

module Cadenya
  module Models
    class AccountInfo < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::AccountInfo, Cadenya::Internal::AnyHash) }

      # An API key for the account. Use workspace-association RPCs to grant the key
      # access to specific workspaces; a key with zero workspaces is valid but cannot
      # access workspace-scoped resources.
      sig { returns(T.nilable(Cadenya::APIKey)) }
      attr_reader :global_api_key

      sig { params(global_api_key: Cadenya::APIKey::OrHash).void }
      attr_writer :global_api_key

      # The generated secret that will sign all webhooks that are sent to your
      # configured Webhook URL. Formatted as "wh_asdf1234" per the
      # https://www.standardwebhooks.com/ format.
      sig { returns(T.nilable(String)) }
      attr_reader :webhook_events_hmac_secret

      sig { params(webhook_events_hmac_secret: String).void }
      attr_writer :webhook_events_hmac_secret

      # Server-populated information about the account.
      sig do
        params(
          global_api_key: Cadenya::APIKey::OrHash,
          webhook_events_hmac_secret: String
        ).returns(T.attached_class)
      end
      def self.new(
        # An API key for the account. Use workspace-association RPCs to grant the key
        # access to specific workspaces; a key with zero workspaces is valid but cannot
        # access workspace-scoped resources.
        global_api_key: nil,
        # The generated secret that will sign all webhooks that are sent to your
        # configured Webhook URL. Formatted as "wh_asdf1234" per the
        # https://www.standardwebhooks.com/ format.
        webhook_events_hmac_secret: nil
      )
      end

      sig do
        override.returns(
          {
            global_api_key: Cadenya::APIKey,
            webhook_events_hmac_secret: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
