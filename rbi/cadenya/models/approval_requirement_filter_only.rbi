# typed: strong

module Cadenya
  module Models
    class ApprovalRequirementFilterOnly < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ApprovalRequirementFilterOnly,
            Cadenya::Internal::AnyHash
          )
        end

      # Top-level filter with simple boolean logic (no nesting)
      sig { returns(Cadenya::ToolFilter) }
      attr_reader :only

      sig { params(only: Cadenya::ToolFilter::OrHash).void }
      attr_writer :only

      sig { returns(Cadenya::ApprovalRequirementFilterOnly::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          only: Cadenya::ToolFilter::OrHash,
          type: Cadenya::ApprovalRequirementFilterOnly::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Top-level filter with simple boolean logic (no nesting)
        only:,
        type:
      )
      end

      sig do
        override.returns(
          {
            only: Cadenya::ToolFilter,
            type: Cadenya::ApprovalRequirementFilterOnly::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ApprovalRequirementFilterOnly::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ONLY =
          T.let(
            :only,
            Cadenya::ApprovalRequirementFilterOnly::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ApprovalRequirementFilterOnly::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
