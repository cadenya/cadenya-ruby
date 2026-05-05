# typed: strong

module Cadenya
  module Models
    class ObjectiveDataSecret < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveDataSecret, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig { returns(T.nilable(String)) }
      attr_reader :value

      sig { params(value: String).void }
      attr_writer :value

      sig { params(name: String, value: String).returns(T.attached_class) }
      def self.new(name: nil, value: nil)
      end

      sig { override.returns({ name: String, value: String }) }
      def to_hash
      end
    end
  end
end
