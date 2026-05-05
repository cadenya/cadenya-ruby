# frozen_string_literal: true

module Cadenya
  module Models
    class ToolEntry < Cadenya::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute spec
      #
      #   @return [Cadenya::Models::ToolSets::ToolSpec]
      required :spec, -> { Cadenya::ToolSets::ToolSpec }

      # @!attribute labels
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, Cadenya::Internal::Type::HashOf[String]

      # @!method initialize(name:, spec:, labels: nil)
      #   @param name [String]
      #   @param spec [Cadenya::Models::ToolSets::ToolSpec]
      #   @param labels [Hash{Symbol=>String}]
    end
  end
end
