# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetEntry < Cadenya::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute spec
      #
      #   @return [Cadenya::Models::ToolSetSpec]
      required :spec, -> { Cadenya::ToolSetSpec }

      # @!attribute labels
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, Cadenya::Internal::Type::HashOf[String]

      # @!attribute tools
      #   Tools in this tool set, keyed by external_id.
      #
      #   @return [Hash{Symbol=>Cadenya::Models::ToolEntry}, nil]
      optional :tools, -> { Cadenya::Internal::Type::HashOf[Cadenya::ToolEntry] }

      # @!method initialize(name:, spec:, labels: nil, tools: nil)
      #   @param name [String]
      #
      #   @param spec [Cadenya::Models::ToolSetSpec]
      #
      #   @param labels [Hash{Symbol=>String}]
      #
      #   @param tools [Hash{Symbol=>Cadenya::Models::ToolEntry}] Tools in this tool set, keyed by external_id.
    end
  end
end
