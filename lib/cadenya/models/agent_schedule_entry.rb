# frozen_string_literal: true

module Cadenya
  module Models
    class AgentScheduleEntry < Cadenya::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute spec
      #   AgentScheduleSpec is the user-provided configuration for a schedule.
      #
      #   @return [Cadenya::Models::Agents::AgentScheduleSpec]
      required :spec, -> { Cadenya::Agents::AgentScheduleSpec }

      # @!attribute labels
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, Cadenya::Internal::Type::HashOf[String]

      # @!method initialize(name:, spec:, labels: nil)
      #   @param name [String]
      #
      #   @param spec [Cadenya::Models::Agents::AgentScheduleSpec] AgentScheduleSpec is the user-provided configuration for a schedule.
      #
      #   @param labels [Hash{Symbol=>String}]
    end
  end
end
