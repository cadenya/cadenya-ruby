# typed: strong

module Cadenya
  module Resources
    class Webhooks
      # @api private
      sig { params(client: Cadenya::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
