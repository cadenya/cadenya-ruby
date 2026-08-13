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
        # @!attribute state
        #   The current lifecycle state of the agent. Output only. Agents are created in
        #   STATE_DRAFT; use the :publish, :unpublish, :archive, and :unarchive actions to
        #   transition between states.
        #
        #   @return [Symbol, Cadenya::Models::Agent::State]
        required :state, enum: -> { Cadenya::Agent::State }

        # @!attribute info
        #   AgentInfo contains simple information about an agent for display or quick
        #   reference
        #
        #   @return [Cadenya::Models::AgentInfo]
        required :info, -> { Cadenya::AgentInfo }
      end

      # @!method initialize(metadata:, spec:, state:, info:)
      #   Some parameter documentations has been truncated, see {Cadenya::Models::Agent}
      #   for more details.
      #
      #   Agent resource
      #
      #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param spec [Cadenya::Models::AgentSpec] Agent specification (user-provided configuration)
      #
      #   @param state [Symbol, Cadenya::Models::Agent::State] The current lifecycle state of the agent. Output only. Agents are created
      #
      #   @param info [Cadenya::Models::AgentInfo] AgentInfo contains simple information about an agent for display or quick refere

      # The current lifecycle state of the agent. Output only. Agents are created in
      # STATE_DRAFT; use the :publish, :unpublish, :archive, and :unarchive actions to
      # transition between states.
      #
      # @see Cadenya::Models::Agent#state
      module State
        extend Cadenya::Internal::Type::Enum

        STATE_UNSPECIFIED = :STATE_UNSPECIFIED
        STATE_DRAFT = :STATE_DRAFT
        STATE_PUBLISHED = :STATE_PUBLISHED
        STATE_ARCHIVED = :STATE_ARCHIVED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
