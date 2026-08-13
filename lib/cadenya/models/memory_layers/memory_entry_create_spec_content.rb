# frozen_string_literal: true

module Cadenya
  module Models
    module MemoryLayers
      class MemoryEntryCreateSpecContent < Cadenya::Internal::Type::BaseModel
        # @!attribute content
        #   Inline content, written directly into the entry.
        #
        #   @return [String]
        required :content, String

        # @!attribute type
        #
        #   @return [Symbol, Cadenya::Models::MemoryLayers::MemoryEntryCreateSpecContent::Type]
        required :type, enum: -> { Cadenya::MemoryLayers::MemoryEntryCreateSpecContent::Type }

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute key
        #   See MemoryEntrySpec.key for the full rule set. Same constraints apply here.
        #
        #   @return [String]
        required :key, String

        # @!method initialize(content:, type:, description: nil, key:)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::MemoryLayers::MemoryEntryCreateSpecContent} for more details.
        #
        #   @param content [String] Inline content, written directly into the entry.
        #
        #   @param type [Symbol, Cadenya::Models::MemoryLayers::MemoryEntryCreateSpecContent::Type]
        #
        #   @param description [String]
        #
        #   @param key [String] See MemoryEntrySpec.key for the full rule set. Same constraints apply

        # @see Cadenya::Models::MemoryLayers::MemoryEntryCreateSpecContent#type
        module Type
          extend Cadenya::Internal::Type::Enum

          CONTENT = :content

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
