# typed: strong

module Cadenya
  module Models
    AgentVariationInfo = Agents::AgentVariationInfo

    module Agents
      class AgentVariationInfo < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::AgentVariationInfo,
              Cadenya::Internal::AnyHash
            )
          end

        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        sig { returns(T.nilable(Cadenya::Profile)) }
        attr_reader :created_by

        sig { params(created_by: Cadenya::Profile::OrHash).void }
        attr_writer :created_by

        # Total number of objective feedbacks received for this variation
        sig { returns(Integer) }
        attr_accessor :feedback_count

        # Thompson Sampling score: posterior mean of Beta(ts_alpha, ts_beta). Range [0, 1]
        # where 0.5 = neutral, >0.5 = positive, <0.5 = negative.
        sig { returns(Float) }
        attr_accessor :score

        # All tools, tool sets, and sub-agents assigned to this variation. Populated on
        # reads so clients can render a variation's full assignment list without calling
        # the add/remove endpoints just to enumerate.
        sig do
          returns(
            T.nilable(T::Array[Cadenya::Agents::VariationAssignment::Variants])
          )
        end
        attr_reader :assignments

        sig do
          params(
            assignments:
              T::Array[
                T.any(
                  Cadenya::Agents::VariationAssignmentTool::OrHash,
                  Cadenya::Agents::VariationAssignmentToolSet::OrHash,
                  Cadenya::Agents::VariationAssignmentAgent::OrHash
                )
              ]
          ).void
        end
        attr_writer :assignments

        # Read-only list of memory layer assignments for this variation, returned in
        # ascending `position` (most specific first — resolution order). Capped at 10
        # entries.
        sig do
          returns(
            T.nilable(T::Array[Cadenya::Agents::VariationMemoryLayerAssignment])
          )
        end
        attr_reader :memory_layer_assignments

        sig do
          params(
            memory_layer_assignments:
              T::Array[Cadenya::Agents::VariationMemoryLayerAssignment::OrHash]
          ).void
        end
        attr_writer :memory_layer_assignments

        # Count of memory layer assignments.
        sig { returns(Integer) }
        attr_accessor :memory_layer_count

        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        sig { returns(T.nilable(Cadenya::ResourceMetadata)) }
        attr_reader :model

        sig { params(model: Cadenya::ResourceMetadata::OrHash).void }
        attr_writer :model

        # Number of sub-agents assigned to this variation
        sig { returns(Integer) }
        attr_accessor :sub_agent_count

        # Number of individual tools assigned to this variation
        sig { returns(Integer) }
        attr_accessor :tool_count

        # Number of tool sets assigned to this variation
        sig { returns(Integer) }
        attr_accessor :tool_set_count

        # AgentVariationInfo provides read-only summary information about a variation
        sig do
          params(
            assignments:
              T::Array[
                T.any(
                  Cadenya::Agents::VariationAssignmentTool::OrHash,
                  Cadenya::Agents::VariationAssignmentToolSet::OrHash,
                  Cadenya::Agents::VariationAssignmentAgent::OrHash
                )
              ],
            feedback_count: Integer,
            memory_layer_assignments:
              T::Array[Cadenya::Agents::VariationMemoryLayerAssignment::OrHash],
            memory_layer_count: Integer,
            score: Float,
            sub_agent_count: Integer,
            tool_count: Integer,
            tool_set_count: Integer,
            created_by: Cadenya::Profile::OrHash,
            model: Cadenya::ResourceMetadata::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # All tools, tool sets, and sub-agents assigned to this variation. Populated on
          # reads so clients can render a variation's full assignment list without calling
          # the add/remove endpoints just to enumerate.
          assignments:,
          # Total number of objective feedbacks received for this variation
          feedback_count:,
          # Read-only list of memory layer assignments for this variation, returned in
          # ascending `position` (most specific first — resolution order). Capped at 10
          # entries.
          memory_layer_assignments:,
          # Count of memory layer assignments.
          memory_layer_count:,
          # Thompson Sampling score: posterior mean of Beta(ts_alpha, ts_beta). Range [0, 1]
          # where 0.5 = neutral, >0.5 = positive, <0.5 = negative.
          score:,
          # Number of sub-agents assigned to this variation
          sub_agent_count:,
          # Number of individual tools assigned to this variation
          tool_count:,
          # Number of tool sets assigned to this variation
          tool_set_count:,
          # A profile identifies a user or non-human principal (such as an API key) at the
          # account level. Profiles are account-scoped and can be granted access to multiple
          # workspaces.
          created_by: nil,
          # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
          model: nil
        )
        end

        sig do
          override.returns(
            {
              assignments:
                T::Array[Cadenya::Agents::VariationAssignment::Variants],
              created_by: Cadenya::Profile,
              feedback_count: Integer,
              memory_layer_assignments:
                T::Array[Cadenya::Agents::VariationMemoryLayerAssignment],
              memory_layer_count: Integer,
              model: Cadenya::ResourceMetadata,
              score: Float,
              sub_agent_count: Integer,
              tool_count: Integer,
              tool_set_count: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
