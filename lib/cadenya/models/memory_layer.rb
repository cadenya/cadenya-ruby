# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::MemoryLayers#create
    class MemoryLayer < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata]
      required :metadata, -> { Cadenya::ResourceMetadata }

      # @!attribute spec
      #
      #   @return [Cadenya::Models::MemoryLayerSpec]
      required :spec, -> { Cadenya::MemoryLayerSpec }

      # @!attribute info
      #
      #   @return [Cadenya::Models::MemoryLayerInfo]
      required :info, -> { Cadenya::MemoryLayerInfo }

      # @!method initialize(metadata:, spec:, info:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::MemoryLayer} for more details.
      #
      #   MemoryLayer is a named container of memory entries that can be composed into an
      #   objective's memory cascade. Layers are workspace-scoped resources. The layer
      #   type controls how its entries participate in the agent loop — see
      #   MemoryLayerType for details.
      #
      #   See "Memory cascade composition" above for how layers compose at lookup time.
      #
      #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param spec [Cadenya::Models::MemoryLayerSpec]
      #
      #   @param info [Cadenya::Models::MemoryLayerInfo]
    end
  end
end
