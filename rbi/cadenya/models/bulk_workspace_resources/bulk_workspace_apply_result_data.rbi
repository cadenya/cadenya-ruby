# typed: strong

module Cadenya
  module Models
    module BulkWorkspaceResources
      class BulkWorkspaceApplyResultData < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultData,
              Cadenya::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentOutcome
            )
          )
        end
        attr_reader :agent

        sig do
          params(
            agent:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentOutcome::OrHash
          ).void
        end
        attr_writer :agent

        sig do
          returns(
            T.nilable(
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentScheduleOutcome
            )
          )
        end
        attr_reader :agent_schedule

        sig do
          params(
            agent_schedule:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentScheduleOutcome::OrHash
          ).void
        end
        attr_writer :agent_schedule

        sig do
          returns(
            T.nilable(
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentVariationOutcome
            )
          )
        end
        attr_reader :agent_variation

        sig do
          params(
            agent_variation:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentVariationOutcome::OrHash
          ).void
        end
        attr_writer :agent_variation

        sig do
          returns(
            T.nilable(
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryEntryOutcome
            )
          )
        end
        attr_reader :memory_entry

        sig do
          params(
            memory_entry:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryEntryOutcome::OrHash
          ).void
        end
        attr_writer :memory_entry

        sig do
          returns(
            T.nilable(
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome
            )
          )
        end
        attr_reader :memory_layer

        sig do
          params(
            memory_layer:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome::OrHash
          ).void
        end
        attr_writer :memory_layer

        sig do
          returns(
            T.nilable(
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolOutcome
            )
          )
        end
        attr_reader :tool

        sig do
          params(
            tool:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolOutcome::OrHash
          ).void
        end
        attr_writer :tool

        sig do
          returns(
            T.nilable(
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome
            )
          )
        end
        attr_reader :tool_set

        sig do
          params(
            tool_set:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::OrHash
          ).void
        end
        attr_writer :tool_set

        sig { returns(T.nilable(String)) }
        attr_reader :type

        sig { params(type: String).void }
        attr_writer :type

        sig do
          returns(
            T.nilable(
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome
            )
          )
        end
        attr_reader :variation_assignment

        sig do
          params(
            variation_assignment:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::OrHash
          ).void
        end
        attr_writer :variation_assignment

        sig do
          returns(
            T.nilable(
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationMemoryLayerOutcome
            )
          )
        end
        attr_reader :variation_memory_layer

        sig do
          params(
            variation_memory_layer:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationMemoryLayerOutcome::OrHash
          ).void
        end
        attr_writer :variation_memory_layer

        # Outcome for a single resource within a bulk apply. The `type` field is the
        # discriminator string naming the populated `outcome` oneof variant (e.g.,
        # "toolSet", "memoryEntry"). Every outcome shell carries an `action` enum and
        # either a resulting resource snapshot (for ACTION_CREATED, ACTION_UPDATED,
        # ACTION_UNCHANGED, ACTION_DELETED) or a google.rpc.Status (for ACTION_FAILED).
        sig do
          params(
            agent:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentOutcome::OrHash,
            agent_schedule:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentScheduleOutcome::OrHash,
            agent_variation:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentVariationOutcome::OrHash,
            memory_entry:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryEntryOutcome::OrHash,
            memory_layer:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome::OrHash,
            tool:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolOutcome::OrHash,
            tool_set:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::OrHash,
            type: String,
            variation_assignment:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::OrHash,
            variation_memory_layer:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationMemoryLayerOutcome::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          agent: nil,
          agent_schedule: nil,
          agent_variation: nil,
          memory_entry: nil,
          memory_layer: nil,
          tool: nil,
          tool_set: nil,
          type: nil,
          variation_assignment: nil,
          variation_memory_layer: nil
        )
        end

        sig do
          override.returns(
            {
              agent:
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentOutcome,
              agent_schedule:
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentScheduleOutcome,
              agent_variation:
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataAgentVariationOutcome,
              memory_entry:
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryEntryOutcome,
              memory_layer:
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome,
              tool:
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolOutcome,
              tool_set:
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome,
              type: String,
              variation_assignment:
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome,
              variation_memory_layer:
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationMemoryLayerOutcome
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
