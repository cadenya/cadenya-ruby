# typed: strong

module Cadenya
  module Models
    class UserMessage < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::UserMessage, Cadenya::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :content

      sig { params(content: String).returns(T.attached_class) }
      def self.new(content: nil)
      end

      sig { override.returns({ content: String }) }
      def to_hash
      end
    end
  end
end
