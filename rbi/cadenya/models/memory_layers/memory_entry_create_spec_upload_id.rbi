# typed: strong

module Cadenya
  module Models
    module MemoryLayers
      class MemoryEntryCreateSpecUploadID < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::MemoryLayers::MemoryEntryCreateSpecUploadID,
              Cadenya::Internal::AnyHash
            )
          end

        sig do
          returns(
            Cadenya::MemoryLayers::MemoryEntryCreateSpecUploadID::Type::OrSymbol
          )
        end
        attr_accessor :type

        # ID of a COMPLETE Upload. The server reads the object from storage, copies its
        # bytes into the entry, and marks the upload consumed.
        sig { returns(String) }
        attr_accessor :upload_id

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # See MemoryEntrySpec.key for the full rule set. Same constraints apply here.
        sig { returns(T.nilable(String)) }
        attr_reader :key

        sig { params(key: String).void }
        attr_writer :key

        sig do
          params(
            type:
              Cadenya::MemoryLayers::MemoryEntryCreateSpecUploadID::Type::OrSymbol,
            upload_id: String,
            description: String,
            key: String
          ).returns(T.attached_class)
        end
        def self.new(
          type:,
          # ID of a COMPLETE Upload. The server reads the object from storage, copies its
          # bytes into the entry, and marks the upload consumed.
          upload_id:,
          description: nil,
          # See MemoryEntrySpec.key for the full rule set. Same constraints apply here.
          key: nil
        )
        end

        sig do
          override.returns(
            {
              type:
                Cadenya::MemoryLayers::MemoryEntryCreateSpecUploadID::Type::OrSymbol,
              upload_id: String,
              description: String,
              key: String
            }
          )
        end
        def to_hash
        end

        module Type
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Cadenya::MemoryLayers::MemoryEntryCreateSpecUploadID::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          UPLOAD_ID =
            T.let(
              :uploadId,
              Cadenya::MemoryLayers::MemoryEntryCreateSpecUploadID::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::MemoryLayers::MemoryEntryCreateSpecUploadID::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
