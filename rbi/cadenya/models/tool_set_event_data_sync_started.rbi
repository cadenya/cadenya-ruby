# typed: strong

module Cadenya
  module Models
    class ToolSetEventDataSyncStarted < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ToolSetEventDataSyncStarted,
            Cadenya::Internal::AnyHash
          )
        end

      # Emitted when a tool set sync operation begins.
      sig { returns(Cadenya::SyncStarted) }
      attr_reader :sync_started

      sig { params(sync_started: Cadenya::SyncStarted::OrHash).void }
      attr_writer :sync_started

      sig { returns(Cadenya::ToolSetEventDataSyncStarted::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          sync_started: Cadenya::SyncStarted::OrHash,
          type: Cadenya::ToolSetEventDataSyncStarted::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Emitted when a tool set sync operation begins.
        sync_started:,
        type:
      )
      end

      sig do
        override.returns(
          {
            sync_started: Cadenya::SyncStarted,
            type: Cadenya::ToolSetEventDataSyncStarted::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ToolSetEventDataSyncStarted::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SYNC_STARTED =
          T.let(
            :syncStarted,
            Cadenya::ToolSetEventDataSyncStarted::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ToolSetEventDataSyncStarted::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
