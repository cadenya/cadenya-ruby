# typed: strong

module Cadenya
  module Models
    # Approval filters that will automatically set the approval requirement on tools
    # synced from an external source
    module ApprovalRequirementFilter
      extend Cadenya::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Cadenya::ApprovalRequirementFilterAlways,
            Cadenya::ApprovalRequirementFilterOnly
          )
        end

      sig do
        override.returns(T::Array[Cadenya::ApprovalRequirementFilter::Variants])
      end
      def self.variants
      end
    end
  end
end
