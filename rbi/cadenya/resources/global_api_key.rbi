# typed: strong

module Cadenya
  module Resources
    # Manage the account's system-provisioned global API key. The global key is the
    # only key that spans every workspace; it is created by the system and cannot be
    # deleted, so the surface is retrieve, rotate, and the disable/enable kill switch.
    class GlobalAPIKey
      # Retrieves the account's global API key. The token is included only when the
      # caller's scopes dominate the key's.
      sig do
        params(request_options: Cadenya::RequestOptions::OrHash).returns(
          Cadenya::APIKey
        )
      end
      def retrieve(request_options: {})
      end

      # Disables the global API key. While disabled, presenting its token fails
      # authentication on every endpoint; the key is retained. Idempotent.
      sig do
        params(request_options: Cadenya::RequestOptions::OrHash).returns(
          Cadenya::APIKey
        )
      end
      def disable(request_options: {})
      end

      # Re-enables the disabled global API key so its token authenticates again.
      # Idempotent.
      sig do
        params(request_options: Cadenya::RequestOptions::OrHash).returns(
          Cadenya::APIKey
        )
      end
      def enable(request_options: {})
      end

      # Rotates the global API key and returns a new token. All previous tokens are
      # invalidated.
      sig do
        params(request_options: Cadenya::RequestOptions::OrHash).returns(
          Cadenya::APIKey
        )
      end
      def rotate(request_options: {})
      end

      # @api private
      sig { params(client: Cadenya::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
