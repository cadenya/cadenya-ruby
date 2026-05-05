# frozen_string_literal: true

module Cadenya
  module Models
    class AgentEntry < Cadenya::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute spec
      #   Agent specification (user-provided configuration)
      #
      #   @return [Cadenya::Models::AgentSpec]
      required :spec, -> { Cadenya::AgentSpec }

      # @!attribute labels
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, Cadenya::Internal::Type::HashOf[String]

      # @!attribute schedules
      #   Schedules under this agent, keyed by external_id.
      #
      #   @return [Hash{Symbol=>Cadenya::Models::AgentScheduleEntry}, nil]
      optional :schedules, -> { Cadenya::Internal::Type::HashOf[Cadenya::AgentScheduleEntry] }

      # @!attribute variations
      #   Variations under this agent, keyed by external_id.
      #
      #   @return [Hash{Symbol=>Cadenya::Models::AgentVariationEntry}, nil]
      optional :variations, -> { Cadenya::Internal::Type::HashOf[Cadenya::AgentVariationEntry] }

      # @!method initialize(name:, spec:, labels: nil, schedules: nil, variations: nil)
      #   @param name [String]
      #
      #   @param spec [Cadenya::Models::AgentSpec] Agent specification (user-provided configuration)
      #
      #   @param labels [Hash{Symbol=>String}]
      #
      #   @param schedules [Hash{Symbol=>Cadenya::Models::AgentScheduleEntry}] Schedules under this agent, keyed by external_id.
      #
      #   @param variations [Hash{Symbol=>Cadenya::Models::AgentVariationEntry}] Variations under this agent, keyed by external_id.
    end
  end
end
