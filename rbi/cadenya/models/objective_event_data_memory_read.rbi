# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataMemoryRead < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveEventDataMemoryRead,
            Cadenya::Internal::AnyHash
          )
        end

      # MemoryRead is emitted each time the agent resolves a key against the memory
      # cascade and loads an entry. Lookups that miss (key not found in any layer) do
      # not emit this event.
      sig { returns(Cadenya::MemoryRead) }
      attr_reader :memory_read

      sig { params(memory_read: Cadenya::MemoryRead::OrHash).void }
      attr_writer :memory_read

      sig { returns(Cadenya::ObjectiveEventDataMemoryRead::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          memory_read: Cadenya::MemoryRead::OrHash,
          type: Cadenya::ObjectiveEventDataMemoryRead::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # MemoryRead is emitted each time the agent resolves a key against the memory
        # cascade and loads an entry. Lookups that miss (key not found in any layer) do
        # not emit this event.
        memory_read:,
        type:
      )
      end

      sig do
        override.returns(
          {
            memory_read: Cadenya::MemoryRead,
            type: Cadenya::ObjectiveEventDataMemoryRead::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ObjectiveEventDataMemoryRead::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MEMORY_READ =
          T.let(
            :memoryRead,
            Cadenya::ObjectiveEventDataMemoryRead::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ObjectiveEventDataMemoryRead::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
