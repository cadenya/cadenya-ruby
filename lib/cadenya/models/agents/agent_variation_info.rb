# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class AgentVariationInfo < Cadenya::Internal::Type::BaseModel
        # @!attribute created_by
        #   A profile identifies a user or non-human principal (such as an API key) at the
        #   account level. Profiles are account-scoped and can be granted access to multiple
        #   workspaces.
        #
        #   @return [Cadenya::Models::Profile, nil]
        optional :created_by, -> { Cadenya::Profile }, api_name: :createdBy

        # @!attribute feedback_count
        #   Total number of objective feedbacks received for this variation
        #
        #   @return [Integer, nil]
        optional :feedback_count, Integer, api_name: :feedbackCount

        # @!attribute score
        #   Thompson Sampling score: posterior mean of Beta(ts_alpha, ts_beta). Range [0, 1]
        #   where 0.5 = neutral, >0.5 = positive, <0.5 = negative.
        #
        #   @return [Float, nil]
        optional :score, Float

        response_only do
          # @!attribute assignments
          #   All tools, tool sets, and sub-agents assigned to this variation. Populated on
          #   reads so clients can render a variation's full assignment list without calling
          #   the add/remove endpoints just to enumerate.
          #
          #   @return [Array<Cadenya::Models::Agents::VariationAssignment>, nil]
          optional :assignments, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::Agents::VariationAssignment] }

          # @!attribute memory_layer_assignments
          #   Read-only list of memory layer assignments for this variation, returned in
          #   ascending `position` (most specific first — resolution order). Capped at 10
          #   entries.
          #
          #   @return [Array<Cadenya::Models::Agents::VariationMemoryLayerAssignment>, nil]
          optional :memory_layer_assignments,
                   -> { Cadenya::Internal::Type::ArrayOf[Cadenya::Agents::VariationMemoryLayerAssignment] },
                   api_name: :memoryLayerAssignments

          # @!attribute memory_layer_count
          #   Count of memory layer assignments.
          #
          #   @return [Integer, nil]
          optional :memory_layer_count, Integer, api_name: :memoryLayerCount

          # @!attribute model
          #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
          #
          #   @return [Cadenya::Models::ResourceMetadata, nil]
          optional :model, -> { Cadenya::ResourceMetadata }

          # @!attribute sub_agent_count
          #   Number of sub-agents assigned to this variation
          #
          #   @return [Integer, nil]
          optional :sub_agent_count, Integer, api_name: :subAgentCount

          # @!attribute tool_count
          #   Number of individual tools assigned to this variation
          #
          #   @return [Integer, nil]
          optional :tool_count, Integer, api_name: :toolCount

          # @!attribute tool_set_count
          #   Number of tool sets assigned to this variation
          #
          #   @return [Integer, nil]
          optional :tool_set_count, Integer, api_name: :toolSetCount
        end

        # @!method initialize(assignments: nil, created_by: nil, feedback_count: nil, memory_layer_assignments: nil, memory_layer_count: nil, model: nil, score: nil, sub_agent_count: nil, tool_count: nil, tool_set_count: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::AgentVariationInfo} for more details.
        #
        #   AgentVariationInfo provides read-only summary information about a variation
        #
        #   @param assignments [Array<Cadenya::Models::Agents::VariationAssignment>] All tools, tool sets, and sub-agents assigned to this variation.
        #
        #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
        #
        #   @param feedback_count [Integer] Total number of objective feedbacks received for this variation
        #
        #   @param memory_layer_assignments [Array<Cadenya::Models::Agents::VariationMemoryLayerAssignment>] Read-only list of memory layer assignments for this variation,
        #
        #   @param memory_layer_count [Integer] Count of memory layer assignments.
        #
        #   @param model [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @param score [Float] Thompson Sampling score: posterior mean of Beta(ts_alpha, ts_beta).
        #
        #   @param sub_agent_count [Integer] Number of sub-agents assigned to this variation
        #
        #   @param tool_count [Integer] Number of individual tools assigned to this variation
        #
        #   @param tool_set_count [Integer] Number of tool sets assigned to this variation
      end
    end

    AgentVariationInfo = Agents::AgentVariationInfo
  end
end
