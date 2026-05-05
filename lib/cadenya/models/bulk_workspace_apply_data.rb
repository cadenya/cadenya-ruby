# frozen_string_literal: true

module Cadenya
  module Models
    class BulkWorkspaceApplyData < Cadenya::Internal::Type::BaseModel
      # @!attribute bundle_key
      #   Required. Bundle ownership key. Resources created or updated by an Apply have
      #   their `metadata.bundle_key` set to this value. On subsequent applies with the
      #   same bundle_key, resources currently bearing this bundle_key but absent from the
      #   spec are soft-deleted.
      #
      #   @return [String]
      required :bundle_key, String, api_name: :bundleKey

      # @!attribute agents
      #   Agents to upsert, keyed by external_id.
      #
      #   @return [Hash{Symbol=>Cadenya::Models::AgentEntry}, nil]
      optional :agents, -> { Cadenya::Internal::Type::HashOf[Cadenya::AgentEntry] }

      # @!attribute automatically_publish_agents
      #   When true, every agent created or updated by this Apply has its status forced to
      #   AGENT_STATUS_PUBLISHED, regardless of the status declared in the agent's
      #   AgentSpec. Useful when the bundle represents a production configuration and you
      #   want all of its agents live without setting status: AGENT_STATUS_PUBLISHED on
      #   each entry.
      #
      #   Default false: each agent's AgentSpec.status controls (which is
      #   AGENT_STATUS_DRAFT on create when unspecified).
      #
      #   @return [Boolean, nil]
      optional :automatically_publish_agents,
               Cadenya::Internal::Type::Boolean,
               api_name: :automaticallyPublishAgents

      # @!attribute memory_layers
      #   Memory layers to upsert, keyed by external_id.
      #
      #   @return [Hash{Symbol=>Cadenya::Models::MemoryLayerEntry}, nil]
      optional :memory_layers,
               -> { Cadenya::Internal::Type::HashOf[Cadenya::MemoryLayerEntry] },
               api_name: :memoryLayers

      # @!attribute source_url
      #   Optional URL pointing to the source of this apply (GitHub PR, Jenkins build,
      #   GitLab pipeline, etc.). Surfaced in the dashboard so users can jump from an
      #   apply back to the change that produced it. Free-form HTTPS URI; not interpreted
      #   by the server.
      #
      #   @return [String, nil]
      optional :source_url, String, api_name: :sourceUrl

      # @!attribute tool_sets
      #   Tool sets to upsert, keyed by external_id.
      #
      #   @return [Hash{Symbol=>Cadenya::Models::ToolSetEntry}, nil]
      optional :tool_sets, -> { Cadenya::Internal::Type::HashOf[Cadenya::ToolSetEntry] }, api_name: :toolSets

      # @!method initialize(bundle_key:, agents: nil, automatically_publish_agents: nil, memory_layers: nil, source_url: nil, tool_sets: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::BulkWorkspaceApplyData} for more details.
      #
      #   @param bundle_key [String] Required. Bundle ownership key. Resources created or updated by an
      #
      #   @param agents [Hash{Symbol=>Cadenya::Models::AgentEntry}] Agents to upsert, keyed by external_id.
      #
      #   @param automatically_publish_agents [Boolean] When true, every agent created or updated by this Apply has its
      #
      #   @param memory_layers [Hash{Symbol=>Cadenya::Models::MemoryLayerEntry}] Memory layers to upsert, keyed by external_id.
      #
      #   @param source_url [String] Optional URL pointing to the source of this apply (GitHub PR,
      #
      #   @param tool_sets [Hash{Symbol=>Cadenya::Models::ToolSetEntry}] Tool sets to upsert, keyed by external_id.
    end
  end
end
