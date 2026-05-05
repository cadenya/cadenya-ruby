# frozen_string_literal: true

module Cadenya
  module Models
    class AgentVariationEntry < Cadenya::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute spec
      #   AgentVariationSpec defines the operational configuration for a variation
      #
      #   @return [Cadenya::Models::Agents::AgentVariationSpec]
      required :spec, -> { Cadenya::Agents::AgentVariationSpec }

      # @!attribute assignments
      #   Reconciled list — server adjusts the variation's assignments to exactly this set
      #   when the variation is bundle-owned.
      #
      #   @return [Array<Cadenya::Models::VariationAssignmentEntry>, nil]
      optional :assignments, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::VariationAssignmentEntry] }

      # @!attribute labels
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, Cadenya::Internal::Type::HashOf[String]

      # @!attribute memory_layers
      #   Reconciled list of memory layer assignments. Up to 10 entries.
      #
      #   @return [Array<Cadenya::Models::VariationMemoryLayerEntry>, nil]
      optional :memory_layers,
               -> { Cadenya::Internal::Type::ArrayOf[Cadenya::VariationMemoryLayerEntry] },
               api_name: :memoryLayers

      # @!method initialize(name:, spec:, assignments: nil, labels: nil, memory_layers: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AgentVariationEntry} for more details.
      #
      #   @param name [String]
      #
      #   @param spec [Cadenya::Models::Agents::AgentVariationSpec] AgentVariationSpec defines the operational configuration for a variation
      #
      #   @param assignments [Array<Cadenya::Models::VariationAssignmentEntry>] Reconciled list — server adjusts the variation's assignments to
      #
      #   @param labels [Hash{Symbol=>String}]
      #
      #   @param memory_layers [Array<Cadenya::Models::VariationMemoryLayerEntry>] Reconciled list of memory layer assignments. Up to 10 entries.
    end
  end
end
