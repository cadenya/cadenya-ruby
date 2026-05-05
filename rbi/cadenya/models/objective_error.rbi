# typed: strong

module Cadenya
  module Models
    class ObjectiveError < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveError, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      sig { params(message: String, type: String).returns(T.attached_class) }
      def self.new(message: nil, type: nil)
      end

      sig { override.returns({ message: String, type: String }) }
      def to_hash
      end
    end
  end
end
