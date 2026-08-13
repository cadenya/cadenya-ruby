# typed: strong

module Cadenya
  module Models
    class ObjectiveSecret < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveSecret, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :name

      sig { params(name: String).returns(T.attached_class) }
      def self.new(name: nil)
      end

      sig { override.returns({ name: String }) }
      def to_hash
      end
    end
  end
end
