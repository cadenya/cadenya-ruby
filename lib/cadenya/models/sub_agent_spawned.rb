# frozen_string_literal: true

module Cadenya
  module Models
    class SubAgentSpawned < Cadenya::Internal::Type::BaseModel
      # @!attribute agent
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata, nil]
      optional :agent, -> { Cadenya::ResourceMetadata }

      # @!attribute objective
      #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #   runs)
      #
      #   @return [Cadenya::Models::OperationMetadata, nil]
      optional :objective, -> { Cadenya::OperationMetadata }

      # @!attribute task
      #
      #   @return [String, nil]
      optional :task, String

      # @!method initialize(agent: nil, objective: nil, task: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::SubAgentSpawned} for more details.
      #
      #   @param agent [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param objective [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #
      #   @param task [String]
    end
  end
end
