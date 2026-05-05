# typed: strong

module Cadenya
  module Models
    class MemoryLayerEntry < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::MemoryLayerEntry, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :name

      sig { returns(Cadenya::MemoryLayerSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::MemoryLayerSpec::OrHash).void }
      attr_writer :spec

      # Memory entries in this layer, keyed by external_id.
      sig { returns(T.nilable(T::Hash[Symbol, Cadenya::MemoryEntryItem])) }
      attr_reader :entries

      sig do
        params(entries: T::Hash[Symbol, Cadenya::MemoryEntryItem::OrHash]).void
      end
      attr_writer :entries

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      sig do
        params(
          name: String,
          spec: Cadenya::MemoryLayerSpec::OrHash,
          entries: T::Hash[Symbol, Cadenya::MemoryEntryItem::OrHash],
          labels: T::Hash[Symbol, String]
        ).returns(T.attached_class)
      end
      def self.new(
        name:,
        spec:,
        # Memory entries in this layer, keyed by external_id.
        entries: nil,
        labels: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            spec: Cadenya::MemoryLayerSpec,
            entries: T::Hash[Symbol, Cadenya::MemoryEntryItem],
            labels: T::Hash[Symbol, String]
          }
        )
      end
      def to_hash
      end
    end
  end
end
