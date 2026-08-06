# typed: strong

module Cadenya
  module Models
    module MemoryLayers
      # MemoryEntryCreateSpec is the input shape for CreateMemoryEntry. It accepts
      # either inline content or a reference to a completed Upload; exactly one of the
      # two must be set.
      module MemoryEntryCreateSpec
        extend Cadenya::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Cadenya::MemoryLayers::MemoryEntryCreateSpecContent,
              Cadenya::MemoryLayers::MemoryEntryCreateSpecUploadID
            )
          end

        sig do
          override.returns(
            T::Array[Cadenya::MemoryLayers::MemoryEntryCreateSpec::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
