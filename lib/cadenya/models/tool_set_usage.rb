# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::ToolSets#list_usage
    class ToolSetUsage < Cadenya::Internal::Type::BaseModel
      response_only do
        # @!attribute assigned_at
        #   When the assignment was created.
        #
        #   @return [Time]
        required :assigned_at, Time, api_name: :assignedAt

        # @!attribute agent
        #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @return [Cadenya::Models::ResourceMetadata]
        required :agent, -> { Cadenya::ResourceMetadata }

        # @!attribute agent_variation
        #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @return [Cadenya::Models::ResourceMetadata]
        required :agent_variation, -> { Cadenya::ResourceMetadata }, api_name: :agentVariation

        # @!attribute model
        #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @return [Cadenya::Models::ResourceMetadata]
        required :model, -> { Cadenya::ResourceMetadata }
      end

      # @!method initialize(assigned_at:, agent:, agent_variation:, model:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolSetUsage} for more details.
      #
      #   ToolSetUsage describes one agent variation that uses the tool set (or, when
      #   filtering by tool, an individual tool within it).
      #
      #   @param assigned_at [Time] When the assignment was created.
      #
      #   @param agent [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param agent_variation [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param model [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
    end
  end
end
