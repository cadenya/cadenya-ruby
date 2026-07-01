# typed: strong

module Cadenya
  module Internal
    class Stream
      Message =
        type_member(:in) { { fixed: Cadenya::Internal::Util::ServerSentEvent } }
      Elem = type_member(:out)

      include Cadenya::Internal::Type::BaseStream

      # @api private
      sig { override.returns(T::Enumerable[Elem]) }
      private def iterator
      end
    end
  end
end
