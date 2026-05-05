# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      # @see Cadenya::Resources::Agents::Variations#create
      class AgentVariation < Cadenya::Internal::Type::BaseModel
        # @!attribute metadata
        #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @return [Cadenya::Models::ResourceMetadata]
        required :metadata, -> { Cadenya::ResourceMetadata }

        # @!attribute spec
        #   AgentVariationSpec defines the operational configuration for a variation
        #
        #   @return [Cadenya::Models::Agents::AgentVariationSpec]
        required :spec, -> { Cadenya::Agents::AgentVariationSpec }

        response_only do
          # @!attribute info
          #   AgentVariationInfo provides read-only summary information about a variation
          #
          #   @return [Cadenya::Models::Agents::AgentVariationInfo, nil]
          optional :info, -> { Cadenya::Agents::AgentVariationInfo }
        end

        # @!method initialize(metadata:, spec:, info: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::AgentVariation} for more details.
        #
        #   AgentVariation resource
        #
        #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @param spec [Cadenya::Models::Agents::AgentVariationSpec] AgentVariationSpec defines the operational configuration for a variation
        #
        #   @param info [Cadenya::Models::Agents::AgentVariationInfo] AgentVariationInfo provides read-only summary information about a variation
      end
    end

    AgentVariation = Agents::AgentVariation
  end
end
