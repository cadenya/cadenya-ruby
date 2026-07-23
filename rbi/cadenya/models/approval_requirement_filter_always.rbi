# typed: strong

module Cadenya
  module Models
    class ApprovalRequirementFilterAlways < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ApprovalRequirementFilterAlways,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :always

      sig { returns(Cadenya::ApprovalRequirementFilterAlways::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          always: T::Boolean,
          type: Cadenya::ApprovalRequirementFilterAlways::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(always:, type:)
      end

      sig do
        override.returns(
          {
            always: T::Boolean,
            type: Cadenya::ApprovalRequirementFilterAlways::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ApprovalRequirementFilterAlways::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ALWAYS =
          T.let(
            :always,
            Cadenya::ApprovalRequirementFilterAlways::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Cadenya::ApprovalRequirementFilterAlways::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
