# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Agents#create
    class Agent < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata]
      required :metadata, -> { Cadenya::ResourceMetadata }

      # @!attribute spec
      #   Agent specification (user-provided configuration)
      #
      #   @return [Cadenya::Models::AgentSpec]
      required :spec, -> { Cadenya::AgentSpec }

      response_only do
        # @!attribute info
        #   AgentInfo contains simple information about an agent for display or quick
        #   reference
        #
        #   @return [Cadenya::Models::AgentInfo, nil]
        optional :info, -> { Cadenya::AgentInfo }
      end

      # @!method initialize(metadata:, spec:, info: nil)
      #   Some parameter documentations has been truncated, see {Cadenya::Models::Agent}
      #   for more details.
      #
      #   Agent resource
      #
      #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param spec [Cadenya::Models::AgentSpec] Agent specification (user-provided configuration)
      #
      #   @param info [Cadenya::Models::AgentInfo] AgentInfo contains simple information about an agent for display or quick refere
    end
  end
end
