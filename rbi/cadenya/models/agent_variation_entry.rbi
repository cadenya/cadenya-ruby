# typed: strong

module Cadenya
  module Models
    class AgentVariationEntry < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::AgentVariationEntry, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :name

      # AgentVariationSpec defines the operational configuration for a variation
      sig { returns(Cadenya::Agents::AgentVariationSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::Agents::AgentVariationSpec::OrHash).void }
      attr_writer :spec

      # Reconciled list — server adjusts the variation's assignments to exactly this set
      # when the variation is bundle-owned.
      sig { returns(T.nilable(T::Array[Cadenya::VariationAssignmentEntry])) }
      attr_reader :assignments

      sig do
        params(
          assignments: T::Array[Cadenya::VariationAssignmentEntry::OrHash]
        ).void
      end
      attr_writer :assignments

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      # Reconciled list of memory layer assignments. Up to 10 entries.
      sig { returns(T.nilable(T::Array[Cadenya::VariationMemoryLayerEntry])) }
      attr_reader :memory_layers

      sig do
        params(
          memory_layers: T::Array[Cadenya::VariationMemoryLayerEntry::OrHash]
        ).void
      end
      attr_writer :memory_layers

      sig do
        params(
          name: String,
          spec: Cadenya::Agents::AgentVariationSpec::OrHash,
          assignments: T::Array[Cadenya::VariationAssignmentEntry::OrHash],
          labels: T::Hash[Symbol, String],
          memory_layers: T::Array[Cadenya::VariationMemoryLayerEntry::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        name:,
        # AgentVariationSpec defines the operational configuration for a variation
        spec:,
        # Reconciled list — server adjusts the variation's assignments to exactly this set
        # when the variation is bundle-owned.
        assignments: nil,
        labels: nil,
        # Reconciled list of memory layer assignments. Up to 10 entries.
        memory_layers: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            spec: Cadenya::Agents::AgentVariationSpec,
            assignments: T::Array[Cadenya::VariationAssignmentEntry],
            labels: T::Hash[Symbol, String],
            memory_layers: T::Array[Cadenya::VariationMemoryLayerEntry]
          }
        )
      end
      def to_hash
      end
    end
  end
end
