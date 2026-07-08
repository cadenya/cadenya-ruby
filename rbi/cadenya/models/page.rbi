# typed: strong

module Cadenya
  module Models
    class Page < Cadenya::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Cadenya::Page, Cadenya::Internal::AnyHash) }

      sig { returns(T.nilable(String)) }
      attr_reader :next_cursor

      sig { params(next_cursor: String).void }
      attr_writer :next_cursor

      # Page carries cursor-based pagination state. There is no total: the cursor walks
      # the result set without ever counting it, and a count would cost a second query
      # on every list.
      sig { params(next_cursor: String).returns(T.attached_class) }
      def self.new(next_cursor: nil)
      end

      sig { override.returns({ next_cursor: String }) }
      def to_hash
      end
    end
  end
end
