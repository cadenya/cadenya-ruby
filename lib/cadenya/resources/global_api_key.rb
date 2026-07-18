# frozen_string_literal: true

module Cadenya
  module Resources
    # Manage the account's system-provisioned global API key. The global key is the
    # only key that spans every workspace; it is created by the system and cannot be
    # deleted, so the surface is retrieve, rotate, and the disable/enable kill switch.
    class GlobalAPIKey
      # Retrieves the account's global API key. The token is included only when the
      # caller's scopes dominate the key's.
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::APIKey]
      #
      # @see Cadenya::Models::GlobalAPIKeyRetrieveParams
      def retrieve(params = {})
        @client.request(
          method: :get,
          path: "v1/account/global_api_key",
          model: Cadenya::APIKey,
          options: params[:request_options]
        )
      end

      # Disables the global API key. While disabled, presenting its token fails
      # authentication on every endpoint; the key is retained. Idempotent.
      #
      # @overload disable(request_options: {})
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::APIKey]
      #
      # @see Cadenya::Models::GlobalAPIKeyDisableParams
      def disable(params = {})
        @client.request(
          method: :post,
          path: "v1/account/global_api_key:disable",
          model: Cadenya::APIKey,
          options: params[:request_options]
        )
      end

      # Re-enables the disabled global API key so its token authenticates again.
      # Idempotent.
      #
      # @overload enable(request_options: {})
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::APIKey]
      #
      # @see Cadenya::Models::GlobalAPIKeyEnableParams
      def enable(params = {})
        @client.request(
          method: :post,
          path: "v1/account/global_api_key:enable",
          model: Cadenya::APIKey,
          options: params[:request_options]
        )
      end

      # Rotates the global API key and returns a new token. All previous tokens are
      # invalidated.
      #
      # @overload rotate(request_options: {})
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::APIKey]
      #
      # @see Cadenya::Models::GlobalAPIKeyRotateParams
      def rotate(params = {})
        @client.request(
          method: :post,
          path: "v1/account/global_api_key:rotate",
          model: Cadenya::APIKey,
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
