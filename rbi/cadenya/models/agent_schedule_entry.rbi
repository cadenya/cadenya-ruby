# typed: strong

module Cadenya
  module Models
    class AgentScheduleEntry < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::AgentScheduleEntry, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :name

      # AgentScheduleSpec is the user-provided configuration for a schedule.
      sig { returns(Cadenya::Agents::AgentScheduleSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::Agents::AgentScheduleSpec::OrHash).void }
      attr_writer :spec

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      # Desired lifecycle state for the schedule. Defaults to STATE_ACTIVE when
      # unspecified. Declare STATE_PAUSED to provision a schedule without it firing.
      # STATE_ARCHIVED is rejected here.
      sig { returns(T.nilable(Cadenya::AgentScheduleEntry::State::OrSymbol)) }
      attr_reader :state

      sig { params(state: Cadenya::AgentScheduleEntry::State::OrSymbol).void }
      attr_writer :state

      sig do
        params(
          name: String,
          spec: Cadenya::Agents::AgentScheduleSpec::OrHash,
          labels: T::Hash[Symbol, String],
          state: Cadenya::AgentScheduleEntry::State::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        name:,
        # AgentScheduleSpec is the user-provided configuration for a schedule.
        spec:,
        labels: nil,
        # Desired lifecycle state for the schedule. Defaults to STATE_ACTIVE when
        # unspecified. Declare STATE_PAUSED to provision a schedule without it firing.
        # STATE_ARCHIVED is rejected here.
        state: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            spec: Cadenya::Agents::AgentScheduleSpec,
            labels: T::Hash[Symbol, String],
            state: Cadenya::AgentScheduleEntry::State::OrSymbol
          }
        )
      end
      def to_hash
      end

      # Desired lifecycle state for the schedule. Defaults to STATE_ACTIVE when
      # unspecified. Declare STATE_PAUSED to provision a schedule without it firing.
      # STATE_ARCHIVED is rejected here.
      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::AgentScheduleEntry::State) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(
            :STATE_UNSPECIFIED,
            Cadenya::AgentScheduleEntry::State::TaggedSymbol
          )
        STATE_ACTIVE =
          T.let(:STATE_ACTIVE, Cadenya::AgentScheduleEntry::State::TaggedSymbol)
        STATE_PAUSED =
          T.let(:STATE_PAUSED, Cadenya::AgentScheduleEntry::State::TaggedSymbol)
        STATE_ARCHIVED =
          T.let(
            :STATE_ARCHIVED,
            Cadenya::AgentScheduleEntry::State::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::AgentScheduleEntry::State::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
