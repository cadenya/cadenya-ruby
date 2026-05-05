# typed: strong

module Cadenya
  module Models
    module MemoryLayers
      class MemoryEntryUpdateSpec < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::MemoryLayers::MemoryEntryUpdateSpec,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :content

        sig { params(content: String).void }
        attr_writer :content

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        sig { returns(T.nilable(String)) }
        attr_reader :key

        sig { params(key: String).void }
        attr_writer :key

        sig { returns(T.nilable(String)) }
        attr_reader :upload_id

        sig { params(upload_id: String).void }
        attr_writer :upload_id

        # MemoryEntryUpdateSpec is the input shape for UpdateMemoryEntry. Fields present
        # in the request's update_mask are applied; unset fields are left alone. The
        # source oneof is optional for updates — omit it to leave the body untouched, or
        # set exactly one branch to replace it.
        sig do
          params(
            content: String,
            description: String,
            key: String,
            upload_id: String
          ).returns(T.attached_class)
        end
        def self.new(content: nil, description: nil, key: nil, upload_id: nil)
        end

        sig do
          override.returns(
            {
              content: String,
              description: String,
              key: String,
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
