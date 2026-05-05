# typed: strong

module Cadenya
  module Internal
    class CursorPagination
      include Cadenya::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :items

      sig { returns(Pagination) }
      attr_accessor :pagination

      # @api private
      sig { returns(String) }
      def inspect
      end

      class Pagination < Cadenya::Internal::Type::BaseModel
        OrHash = T.type_alias { T.any(Pagination, Cadenya::Internal::AnyHash) }

        sig { returns(T.nilable(String)) }
        attr_reader :next_cursor

        sig { params(next_cursor: String).void }
        attr_writer :next_cursor

        sig { params(next_cursor: String).returns(T.attached_class) }
        def self.new(next_cursor: nil)
        end

        sig { override.returns({ next_cursor: String }) }
        def to_hash
        end
      end
    end
  end
end
