# frozen_string_literal: true

module Cadenya
  module Resources
    # Manage the authenticated account. Accounts are the top-level organizational unit
    # and contain one or more workspaces.
    class Account
      # Retrieves the current account for the token accessing the API. Useful to check
      # if the credentials are valid.
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::AccountAPI]
      #
      # @see Cadenya::Models::AccountRetrieveParams
      def retrieve(params = {})
        @client.request(
          method: :get,
          path: "v1/account",
          model: Cadenya::AccountAPI,
          options: params[:request_options]
        )
      end

      # Rotates the webhook signing key for the account. Returns only the new key.
      #
      # @overload rotate_webhook_signing_key(request_options: {})
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::RotateWebhookSigningKeyResponse]
      #
      # @see Cadenya::Models::AccountRotateWebhookSigningKeyParams
      def rotate_webhook_signing_key(params = {})
        @client.request(
          method: :post,
          path: "v1/account:rotateWebhookSigningKey",
          model: Cadenya::RotateWebhookSigningKeyResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Cadenya::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
