# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      # A read-only reference to a single tool, tool set, or sub-agent attached to a
      # variation. Read the full set of assignments via
      # `AgentVariationInfo.assignments`; mutations go through the dedicated add/remove
      # assignment endpoints.
      #
      # The `id` identifies the assignment itself (not the referenced resource) and is
      # the handle used to remove the assignment. It is returned by the add endpoint and
      # present on every entry in `AgentVariationInfo.assignments`.
      #
      # @see Cadenya::Resources::Agents::Variations#add_assignment
      module VariationAssignment
        extend Cadenya::Internal::Type::Union

        discriminator :type

        variant :tool, -> { Cadenya::Agents::VariationAssignmentTool }

        variant :toolSet, -> { Cadenya::Agents::VariationAssignmentToolSet }

        variant :agent, -> { Cadenya::Agents::VariationAssignmentAgent }

        # @!method self.variants
        #   @return [Array(Cadenya::Models::Agents::VariationAssignmentTool, Cadenya::Models::Agents::VariationAssignmentToolSet, Cadenya::Models::Agents::VariationAssignmentAgent)]
      end
    end
  end
end
