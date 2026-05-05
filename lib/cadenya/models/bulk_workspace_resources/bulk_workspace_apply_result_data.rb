# frozen_string_literal: true

module Cadenya
  module Models
    module BulkWorkspaceResources
      class BulkWorkspaceApplyResultData < Cadenya::Internal::Type::BaseModel
        # @!attribute agent
        #
        #   @return [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentOutcome, nil]
        optional :agent, -> { Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentOutcome }

        # @!attribute agent_schedule
        #
        #   @return [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentScheduleOutcome, nil]
        optional :agent_schedule,
                 -> { Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentScheduleOutcome },
                 api_name: :agentSchedule

        # @!attribute agent_variation
        #
        #   @return [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentVariationOutcome, nil]
        optional :agent_variation,
                 -> { Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentVariationOutcome },
                 api_name: :agentVariation

        # @!attribute memory_entry
        #
        #   @return [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryEntryOutcome, nil]
        optional :memory_entry,
                 -> { Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryEntryOutcome },
                 api_name: :memoryEntry

        # @!attribute memory_layer
        #
        #   @return [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome, nil]
        optional :memory_layer,
                 -> { Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome },
                 api_name: :memoryLayer

        # @!attribute tool
        #
        #   @return [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolOutcome, nil]
        optional :tool, -> { Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolOutcome }

        # @!attribute tool_set
        #
        #   @return [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome, nil]
        optional :tool_set,
                 -> { Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome },
                 api_name: :toolSet

        # @!attribute type
        #
        #   @return [String, nil]
        optional :type, String

        # @!attribute variation_assignment
        #
        #   @return [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome, nil]
        optional :variation_assignment,
                 -> {
                   Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome
                 },
                 api_name: :variationAssignment

        # @!attribute variation_memory_layer
        #
        #   @return [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationMemoryLayerOutcome, nil]
        optional :variation_memory_layer,
                 -> {
                   Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationMemoryLayerOutcome
                 },
                 api_name: :variationMemoryLayer

        # @!method initialize(agent: nil, agent_schedule: nil, agent_variation: nil, memory_entry: nil, memory_layer: nil, tool: nil, tool_set: nil, type: nil, variation_assignment: nil, variation_memory_layer: nil)
        #   Outcome for a single resource within a bulk apply. The `type` field is the
        #   discriminator string naming the populated `outcome` oneof variant (e.g.,
        #   "toolSet", "memoryEntry"). Every outcome shell carries an `action` enum and
        #   either a resulting resource snapshot (for ACTION_CREATED, ACTION_UPDATED,
        #   ACTION_UNCHANGED, ACTION_DELETED) or a google.rpc.Status (for ACTION_FAILED).
        #
        #   @param agent [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentOutcome]
        #   @param agent_schedule [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentScheduleOutcome]
        #   @param agent_variation [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentVariationOutcome]
        #   @param memory_entry [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryEntryOutcome]
        #   @param memory_layer [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome]
        #   @param tool [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolOutcome]
        #   @param tool_set [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome]
        #   @param type [String]
        #   @param variation_assignment [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome]
        #   @param variation_memory_layer [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationMemoryLayerOutcome]
      end
    end
  end
end
