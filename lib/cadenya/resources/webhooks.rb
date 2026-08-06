# frozen_string_literal: true

module Cadenya
  module Resources
    class Webhooks
      # @api private
      #
      # @param client [Cadenya::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
