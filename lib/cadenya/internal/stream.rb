# frozen_string_literal: true

module Cadenya
  module Internal
    # @generic Elem
    #
    # @example
    #   stream.each do |event|
    #     puts(event)
    #   end
    class Stream
      include Cadenya::Internal::Type::BaseStream

      # @api private
      #
      # @return [Enumerable<generic<Elem>>]
      private def iterator
        @iterator ||= Cadenya::Internal::Util.chain_fused(@stream) do |y|
          @stream.each do |msg|
            case msg
            in {data: String => data}
              decoded = JSON.parse(data, symbolize_names: true)
              unwrapped = Cadenya::Internal::Util.dig(decoded, @unwrap)
              y << Cadenya::Internal::Type::Converter.coerce(@model, unwrapped)
            else
            end
          end
        end
      end
    end
  end
end
