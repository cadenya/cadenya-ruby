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

      sig do
        params(
          name: String,
          spec: Cadenya::Agents::AgentScheduleSpec::OrHash,
          labels: T::Hash[Symbol, String]
        ).returns(T.attached_class)
      end
      def self.new(
        name:,
        # AgentScheduleSpec is the user-provided configuration for a schedule.
        spec:,
        labels: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            spec: Cadenya::Agents::AgentScheduleSpec,
            labels: T::Hash[Symbol, String]
          }
        )
      end
      def to_hash
      end
    end
  end
end
