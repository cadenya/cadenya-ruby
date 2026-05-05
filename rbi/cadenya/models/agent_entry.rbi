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
            variations: T::Hash[Symbol, Cadenya::AgentVariationEntry]
          }
        )
      end
      def to_hash
      end
    end
  end
end
