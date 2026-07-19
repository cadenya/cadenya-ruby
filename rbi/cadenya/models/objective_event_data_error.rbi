# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataError < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveEventDataError, Cadenya::Internal::AnyHash)
        end

      sig { returns(Cadenya::ObjectiveError) }
      attr_reader :error

      sig { params(error: Cadenya::ObjectiveError::OrHash).void }
      attr_writer :error

      sig { returns(Cadenya::ObjectiveEventDataError::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          error: Cadenya::ObjectiveError::OrHash,
          type: Cadenya::ObjectiveEventDataError::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(error:, type:)
      end

      sig do
        override.returns(
          {
            error: Cadenya::ObjectiveError,
            type: Cadenya::ObjectiveEventDataError::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::ObjectiveEventDataError::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ERROR =
          T.let(:error, Cadenya::ObjectiveEventDataError::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::ObjectiveEventDataError::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
