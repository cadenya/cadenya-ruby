# typed: strong

module Cadenya
  module Models
    class AgentEntry < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::AgentEntry, Cadenya::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :name

      # Agent specification (user-provided configuration)
      sig { returns(Cadenya::AgentSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::AgentSpec::OrHash).void }
      attr_writer :spec

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      # Schedules under this agent, keyed by external_id.
      sig { returns(T.nilable(T::Hash[Symbol, Cadenya::AgentScheduleEntry])) }
      attr_reader :schedules

      sig do
        params(
          schedules: T::Hash[Symbol, Cadenya::AgentScheduleEntry::OrHash]
        ).void
      end
      attr_writer :schedules

      # Desired lifecycle state for the agent. Defaults to STATE_DRAFT when unspecified.
      # STATE_PUBLISHED publishes the agent once its variations exist; see also
      # BulkWorkspaceApplyData.automatically_publish_agents.
      sig { returns(T.nilable(Cadenya::AgentEntry::State::OrSymbol)) }
      attr_reader :state

      sig { params(state: Cadenya::AgentEntry::State::OrSymbol).void }
      attr_writer :state

      # Variations under this agent, keyed by external_id.
      sig { returns(T.nilable(T::Hash[Symbol, Cadenya::AgentVariationEntry])) }
      attr_reader :variations

      sig do
        params(
          variations: T::Hash[Symbol, Cadenya::AgentVariationEntry::OrHash]
        ).void
      end
      attr_writer :variations

      sig do
        params(
          name: String,
          spec: Cadenya::AgentSpec::OrHash,
          labels: T::Hash[Symbol, String],
          schedules: T::Hash[Symbol, Cadenya::AgentScheduleEntry::OrHash],
          state: Cadenya::AgentEntry::State::OrSymbol,
          variations: T::Hash[Symbol, Cadenya::AgentVariationEntry::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        name:,
        # Agent specification (user-provided configuration)
        spec:,
        labels: nil,
        # Schedules under this agent, keyed by external_id.
        schedules: nil,
        # Desired lifecycle state for the agent. Defaults to STATE_DRAFT when unspecified.
        # STATE_PUBLISHED publishes the agent once its variations exist; see also
        # BulkWorkspaceApplyData.automatically_publish_agents.
        state: nil,
        # Variations under this agent, keyed by external_id.
        variations: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            spec: Cadenya::AgentSpec,
            labels: T::Hash[Symbol, String],
            schedules: T::Hash[Symbol, Cadenya::AgentScheduleEntry],
            state: Cadenya::AgentEntry::State::OrSymbol,
            variations: T::Hash[Symbol, Cadenya::AgentVariationEntry]
          }
        )
      end
      def to_hash
      end

      # Desired lifecycle state for the agent. Defaults to STATE_DRAFT when unspecified.
      # STATE_PUBLISHED publishes the agent once its variations exist; see also
      # BulkWorkspaceApplyData.automatically_publish_agents.
      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::AgentEntry::State) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(:STATE_UNSPECIFIED, Cadenya::AgentEntry::State::TaggedSymbol)
        STATE_DRAFT =
          T.let(:STATE_DRAFT, Cadenya::AgentEntry::State::TaggedSymbol)
        STATE_PUBLISHED =
          T.let(:STATE_PUBLISHED, Cadenya::AgentEntry::State::TaggedSymbol)
        STATE_ARCHIVED =
          T.let(:STATE_ARCHIVED, Cadenya::AgentEntry::State::TaggedSymbol)

        sig do
          override.returns(T::Array[Cadenya::AgentEntry::State::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
