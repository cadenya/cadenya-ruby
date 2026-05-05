# typed: strong

module Cadenya
  module Models
    class SyncStarted < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::SyncStarted, Cadenya::Internal::AnyHash) }

      # Human-readable message describing the start of the sync.
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      # Emitted when a tool set sync operation begins.
      sig { params(message: String).returns(T.attached_class) }
      def self.new(
        # Human-readable message describing the start of the sync.
        message: nil
      )
      end

      sig { override.returns({ message: String }) }
      def to_hash
      end
    end
  end
end
