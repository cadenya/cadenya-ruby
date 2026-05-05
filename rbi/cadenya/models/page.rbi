# typed: strong

module Cadenya
  module Models
    class Page < Cadenya::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Cadenya::Page, Cadenya::Internal::AnyHash) }

      sig { returns(T.nilable(String)) }
      attr_reader :next_cursor

      sig { params(next_cursor: String).void }
      attr_writer :next_cursor

      sig { returns(T.nilable(Integer)) }
      attr_reader :total

      sig { params(total: Integer).void }
      attr_writer :total

      sig do
        params(next_cursor: String, total: Integer).returns(T.attached_class)
      end
      def self.new(next_cursor: nil, total: nil)
      end

      sig { override.returns({ next_cursor: String, total: Integer }) }
      def to_hash
      end
    end
  end
end
