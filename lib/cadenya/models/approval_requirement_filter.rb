# frozen_string_literal: true

module Cadenya
  module Models
    # Approval filters that will automatically set the approval requirement on tools
    # synced from an external source
    module ApprovalRequirementFilter
      extend Cadenya::Internal::Type::Union

      discriminator :type

      variant :always, -> { Cadenya::ApprovalRequirementFilterAlways }

      variant :only, -> { Cadenya::ApprovalRequirementFilterOnly }

      # @!method self.variants
      #   @return [Array(Cadenya::Models::ApprovalRequirementFilterAlways, Cadenya::Models::ApprovalRequirementFilterOnly)]
    end
  end
end
