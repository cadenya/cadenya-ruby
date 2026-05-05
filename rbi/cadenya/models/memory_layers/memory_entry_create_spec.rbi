# typed: strong

module Cadenya
  module Models
    module MemoryLayers
      class MemoryEntryCreateSpec < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::MemoryLayers::MemoryEntryCreateSpec,
              Cadenya::Internal::AnyHash
            )
          end

        # See MemoryEntrySpec.key for the full rule set. Same constraints apply here.
        sig { returns(String) }
        attr_accessor :key

        # Inline content, written directly into the entry.
        sig { returns(T.nilable(String)) }
        attr_reader :content

        sig { params(content: String).void }
        attr_writer :content

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # ID of a COMPLETE Upload. The server reads the object from storage, copies its
        # bytes into the entry, and marks the upload consumed.
        sig { returns(T.nilable(String)) }
        attr_reader :upload_id

        sig { params(upload_id: String).void }
        attr_writer :upload_id

        # MemoryEntryCreateSpec is the input shape for CreateMemoryEntry. It accepts
        # either inline content or a reference to a completed Upload; exactly one of the
        # two must be set.
        sig do
          params(
            key: String,
            content: String,
            description: String,
            upload_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # See MemoryEntrySpec.key for the full rule set. Same constraints apply here.
          key:,
          # Inline content, written directly into the entry.
          content: nil,
          description: nil,
          # ID of a COMPLETE Upload. The server reads the object from storage, copies its
          # bytes into the entry, and marks the upload consumed.
          upload_id: nil
        )
        end

        sig do
          override.returns(
            {
              key: String,
              content: String,
              description: String,
              upload_id: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
