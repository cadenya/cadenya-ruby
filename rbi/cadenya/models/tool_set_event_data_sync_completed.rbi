# typed: strong

module Cadenya
  module Models
    class ToolSetEventDataSyncCompleted < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ToolSetEventDataSyncCompleted,
            Cadenya::Internal::AnyHash
          )
        end

      # Emitted when a tool set sync operation completes successfully.
      sig { returns(Cadenya::SyncCompleted) }
      attr_reader :sync_completed

      sig { params(sync_completed: Cadenya::SyncCompleted::OrHash).void }
      attr_writer :sync_completed

      sig do
        returns(Cadenya::ToolSetEventDataSyncCompleted::Type::TaggedSymbol)
      end
      attr_accessor :type

      sig do
        params(
          sync_completed: Cadenya::SyncCompleted::OrHash,
          type: Cadenya::ToolSetEventDataSyncCompleted::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Emitted when a tool set sync operation completes successfully.
        sync_completed:,
        type:
      )
      end

      sig do
        override.returns(
          {
            sync_completed: Cadenya::SyncCompleted,
            type: Cadenya::ToolSetEventDataSyncCompleted::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ToolSetEventDataSyncCompleted::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SYNC_COMPLETED =
          T.let(
            :syncCompleted,
            Cadenya::ToolSetEventDataSyncCompleted::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ToolSetEventDataSyncCompleted::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
