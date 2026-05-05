# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Objectives#compact
    class ObjectiveCompactParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String]
      required :workspace_id, String

      # @!attribute objective_id
      #
      #   @return [String]
      required :objective_id, String

      # @!attribute compaction_config
      #   CompactionConfig defines how context window compaction behaves for objectives
      #   using this variation.
      #
      #   @return [Cadenya::Models::Agents::AgentVariationSpecCompactionConfig, nil]
      optional :compaction_config,
               -> { Cadenya::Agents::AgentVariationSpecCompactionConfig },
               api_name: :compactionConfig

      # @!method initialize(workspace_id:, objective_id:, compaction_config: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveCompactParams} for more details.
      #
      #   @param workspace_id [String]
      #
      #   @param objective_id [String]
      #
      #   @param compaction_config [Cadenya::Models::Agents::AgentVariationSpecCompactionConfig] CompactionConfig defines how context window compaction behaves for objectives us
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
