# typed: strong

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
      module VariationAssignment
        extend Cadenya::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Cadenya::Agents::VariationAssignmentTool,
              Cadenya::Agents::VariationAssignmentToolSet,
              Cadenya::Agents::VariationAssignmentAgent
            )
          end

        sig do
          override.returns(
            T::Array[Cadenya::Agents::VariationAssignment::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
