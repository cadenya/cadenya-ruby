# typed: strong

module Cadenya
  module Models
    class MemoryEntryItem < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::MemoryEntryItem, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :key

      sig { returns(T.nilable(String)) }
      attr_reader :content

      sig { params(content: String).void }
      attr_writer :content

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig { returns(T.nilable(String)) }
      attr_reader :upload_id

      sig { params(upload_id: String).void }
      attr_writer :upload_id

      sig do
        params(
          key: String,
          content: String,
          description: String,
          upload_id: String
        ).returns(T.attached_class)
      end
      def self.new(key:, content: nil, description: nil, upload_id: nil)
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
