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

      # @!attribute state
      #   Desired lifecycle state for the agent. Defaults to STATE_DRAFT when unspecified.
      #   STATE_PUBLISHED publishes the agent once its variations exist; see also
      #   BulkWorkspaceApplyData.automatically_publish_agents.
      #
      #   @return [Symbol, Cadenya::Models::AgentEntry::State, nil]
      optional :state, enum: -> { Cadenya::AgentEntry::State }

      # @!attribute variations
      #   Variations under this agent, keyed by external_id.
      #
      #   @return [Hash{Symbol=>Cadenya::Models::AgentVariationEntry}, nil]
      optional :variations, -> { Cadenya::Internal::Type::HashOf[Cadenya::AgentVariationEntry] }

      # @!method initialize(name:, spec:, labels: nil, schedules: nil, state: nil, variations: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AgentEntry} for more details.
      #
      #   @param name [String]
      #
      #   @param spec [Cadenya::Models::AgentSpec] Agent specification (user-provided configuration)
      #
      #   @param labels [Hash{Symbol=>String}]
      #
      #   @param schedules [Hash{Symbol=>Cadenya::Models::AgentScheduleEntry}] Schedules under this agent, keyed by external_id.
      #
      #   @param state [Symbol, Cadenya::Models::AgentEntry::State] Desired lifecycle state for the agent. Defaults to STATE_DRAFT when
      #
      #   @param variations [Hash{Symbol=>Cadenya::Models::AgentVariationEntry}] Variations under this agent, keyed by external_id.

      # Desired lifecycle state for the agent. Defaults to STATE_DRAFT when unspecified.
      # STATE_PUBLISHED publishes the agent once its variations exist; see also
      # BulkWorkspaceApplyData.automatically_publish_agents.
      #
      # @see Cadenya::Models::AgentEntry#state
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
