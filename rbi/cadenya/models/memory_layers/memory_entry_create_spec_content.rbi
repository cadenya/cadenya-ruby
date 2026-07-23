# typed: strong

module Cadenya
  module Models
    module MemoryLayers
      class MemoryEntryCreateSpecContent < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::MemoryLayers::MemoryEntryCreateSpecContent,
              Cadenya::Internal::AnyHash
            )
          end

        # Inline content, written directly into the entry.
        sig { returns(String) }
        attr_accessor :content

        sig do
          returns(
            Cadenya::MemoryLayers::MemoryEntryCreateSpecContent::Type::OrSymbol
          )
        end
        attr_accessor :type

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
            content: String,
            type:
              Cadenya::MemoryLayers::MemoryEntryCreateSpecContent::Type::OrSymbol,
            description: String,
            key: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Inline content, written directly into the entry.
          content:,
          type:,
          description: nil,
          # See MemoryEntrySpec.key for the full rule set. Same constraints apply here.
          key: nil
        )
        end

        sig do
          override.returns(
            {
              content: String,
              type:
                Cadenya::MemoryLayers::MemoryEntryCreateSpecContent::Type::OrSymbol,
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
                Cadenya::MemoryLayers::MemoryEntryCreateSpecContent::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CONTENT =
            T.let(
              :content,
              Cadenya::MemoryLayers::MemoryEntryCreateSpecContent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::MemoryLayers::MemoryEntryCreateSpecContent::Type::TaggedSymbol
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
