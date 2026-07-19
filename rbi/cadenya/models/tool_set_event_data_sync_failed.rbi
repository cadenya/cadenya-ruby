# typed: strong

module Cadenya
  module Models
    class ToolSetEventDataSyncFailed < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetEventDataSyncFailed, Cadenya::Internal::AnyHash)
        end

      # Emitted when a tool set sync operation fails.
      sig { returns(Cadenya::SyncFailed) }
      attr_reader :sync_failed

      sig { params(sync_failed: Cadenya::SyncFailed::OrHash).void }
      attr_writer :sync_failed

      sig { returns(Cadenya::ToolSetEventDataSyncFailed::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          sync_failed: Cadenya::SyncFailed::OrHash,
          type: Cadenya::ToolSetEventDataSyncFailed::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Emitted when a tool set sync operation fails.
        sync_failed:,
        type:
      )
      end

      sig do
        override.returns(
          {
            sync_failed: Cadenya::SyncFailed,
            type: Cadenya::ToolSetEventDataSyncFailed::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ToolSetEventDataSyncFailed::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SYNC_FAILED =
          T.let(
            :syncFailed,
            Cadenya::ToolSetEventDataSyncFailed::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ToolSetEventDataSyncFailed::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
