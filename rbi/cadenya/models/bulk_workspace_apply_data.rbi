# typed: strong

module Cadenya
  module Models
    class BulkWorkspaceApplyData < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::BulkWorkspaceApplyData, Cadenya::Internal::AnyHash)
        end

      # Required. Bundle ownership key. Resources created or updated by an Apply have
      # their `metadata.bundle_key` set to this value. On subsequent applies with the
      # same bundle_key, resources currently bearing this bundle_key but absent from the
      # spec are soft-deleted.
      sig { returns(String) }
      attr_accessor :bundle_key

      # Agents to upsert, keyed by external_id.
      sig { returns(T.nilable(T::Hash[Symbol, Cadenya::AgentEntry])) }
      attr_reader :agents

      sig { params(agents: T::Hash[Symbol, Cadenya::AgentEntry::OrHash]).void }
      attr_writer :agents

      # When true, every agent created or updated by this Apply has its state forced to
      # STATE_PUBLISHED, regardless of the state declared on the agent's entry. Useful
      # when the bundle represents a production configuration and you want all of its
      # agents live without setting state: STATE_PUBLISHED on each entry.
      #
      # Default false: each agent entry's `state` controls (which is STATE_DRAFT on
      # create when unspecified).
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :automatically_publish_agents

      sig { params(automatically_publish_agents: T::Boolean).void }
      attr_writer :automatically_publish_agents

      # Memory layers to upsert, keyed by external_id.
      sig { returns(T.nilable(T::Hash[Symbol, Cadenya::MemoryLayerEntry])) }
      attr_reader :memory_layers

      sig do
        params(
          memory_layers: T::Hash[Symbol, Cadenya::MemoryLayerEntry::OrHash]
        ).void
      end
      attr_writer :memory_layers

      # Optional URL pointing to the source of this apply (GitHub PR, Jenkins build,
      # GitLab pipeline, etc.). Surfaced in the dashboard so users can jump from an
      # apply back to the change that produced it. Free-form HTTPS URI; not interpreted
      # by the server.
      sig { returns(T.nilable(String)) }
      attr_reader :source_url

      sig { params(source_url: String).void }
      attr_writer :source_url

      # Tool sets to upsert, keyed by external_id.
      sig { returns(T.nilable(T::Hash[Symbol, Cadenya::ToolSetEntry])) }
      attr_reader :tool_sets

      sig do
        params(tool_sets: T::Hash[Symbol, Cadenya::ToolSetEntry::OrHash]).void
      end
      attr_writer :tool_sets

      sig do
        params(
          bundle_key: String,
          agents: T::Hash[Symbol, Cadenya::AgentEntry::OrHash],
          automatically_publish_agents: T::Boolean,
          memory_layers: T::Hash[Symbol, Cadenya::MemoryLayerEntry::OrHash],
          source_url: String,
          tool_sets: T::Hash[Symbol, Cadenya::ToolSetEntry::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Required. Bundle ownership key. Resources created or updated by an Apply have
        # their `metadata.bundle_key` set to this value. On subsequent applies with the
        # same bundle_key, resources currently bearing this bundle_key but absent from the
        # spec are soft-deleted.
        bundle_key:,
        # Agents to upsert, keyed by external_id.
        agents: nil,
        # When true, every agent created or updated by this Apply has its state forced to
        # STATE_PUBLISHED, regardless of the state declared on the agent's entry. Useful
        # when the bundle represents a production configuration and you want all of its
        # agents live without setting state: STATE_PUBLISHED on each entry.
        #
        # Default false: each agent entry's `state` controls (which is STATE_DRAFT on
        # create when unspecified).
        automatically_publish_agents: nil,
        # Memory layers to upsert, keyed by external_id.
        memory_layers: nil,
        # Optional URL pointing to the source of this apply (GitHub PR, Jenkins build,
        # GitLab pipeline, etc.). Surfaced in the dashboard so users can jump from an
        # apply back to the change that produced it. Free-form HTTPS URI; not interpreted
        # by the server.
        source_url: nil,
        # Tool sets to upsert, keyed by external_id.
        tool_sets: nil
      )
      end

      sig do
        override.returns(
          {
            bundle_key: String,
            agents: T::Hash[Symbol, Cadenya::AgentEntry],
            automatically_publish_agents: T::Boolean,
            memory_layers: T::Hash[Symbol, Cadenya::MemoryLayerEntry],
            source_url: String,
            tool_sets: T::Hash[Symbol, Cadenya::ToolSetEntry]
          }
        )
      end
      def to_hash
      end
    end
  end
end
