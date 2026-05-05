# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      # @see Cadenya::Resources::Agents::Schedules#create
      class ScheduleCreateParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!attribute agent_id
        #
        #   @return [String]
        required :agent_id, String

        # @!attribute metadata
        #   CreateResourceMetadata contains the user-provided fields for creating a
        #   workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        #   profile_id, created_at) are excluded since they are set by the server.
        #
        #   @return [Cadenya::Models::CreateResourceMetadata]
        required :metadata, -> { Cadenya::CreateResourceMetadata }

        # @!attribute spec
        #   AgentScheduleSpec is the user-provided configuration for a schedule.
        #
        #   @return [Cadenya::Models::Agents::AgentScheduleSpec]
        required :spec, -> { Cadenya::Agents::AgentScheduleSpec }

        # @!method initialize(workspace_id:, agent_id:, metadata:, spec:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::ScheduleCreateParams} for more details.
        #
        #   @param workspace_id [String]
        #
        #   @param agent_id [String]
        #
        #   @param metadata [Cadenya::Models::CreateResourceMetadata] CreateResourceMetadata contains the user-provided fields for creating
        #
        #   @param spec [Cadenya::Models::Agents::AgentScheduleSpec] AgentScheduleSpec is the user-provided configuration for a schedule.
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
