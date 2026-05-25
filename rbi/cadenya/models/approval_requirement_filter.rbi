# typed: strong

module Cadenya
  module Models
    class ApprovalRequirementFilter < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ApprovalRequirementFilter, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :always

      sig { params(always: T::Boolean).void }
      attr_writer :always

      # Top-level filter with simple boolean logic (no nesting)
      sig { returns(T.nilable(Cadenya::ToolFilter)) }
      attr_reader :only

      sig { params(only: Cadenya::ToolFilter::OrHash).void }
      attr_writer :only

      # Approval filters that will automatically set the approval requirement on tools
      # synced from an external source
      sig do
        params(always: T::Boolean, only: Cadenya::ToolFilter::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(
        always: nil,
        # Top-level filter with simple boolean logic (no nesting)
        only: nil
      )
      end

      sig do
        override.returns({ always: T::Boolean, only: Cadenya::ToolFilter })
      end
      def to_hash
      end
    end
  end
end
