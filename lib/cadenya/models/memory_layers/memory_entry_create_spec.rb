# frozen_string_literal: true

module Cadenya
  module Models
    module MemoryLayers
      # MemoryEntryCreateSpec is the input shape for CreateMemoryEntry. It accepts
      # either inline content or a reference to a completed Upload; exactly one of the
      # two must be set.
      module MemoryEntryCreateSpec
        extend Cadenya::Internal::Type::Union

        discriminator :type

        variant :content, -> { Cadenya::MemoryLayers::MemoryEntryCreateSpecContent }

        variant :uploadId, -> { Cadenya::MemoryLayers::MemoryEntryCreateSpecUploadID }

        # @!method self.variants
        #   @return [Array(Cadenya::Models::MemoryLayers::MemoryEntryCreateSpecContent, Cadenya::Models::MemoryLayers::MemoryEntryCreateSpecUploadID)]
      end
    end
  end
end
