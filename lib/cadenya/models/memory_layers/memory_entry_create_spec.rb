# frozen_string_literal: true

module Cadenya
  module Models
    module MemoryLayers
      class MemoryEntryCreateSpec < Cadenya::Internal::Type::BaseModel
        # @!attribute key
        #   See MemoryEntrySpec.key for the full rule set. Same constraints apply here.
        #
        #   @return [String]
        required :key, String

        # @!attribute content
        #   Inline content, written directly into the entry.
        #
        #   @return [String, nil]
        optional :content, String

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute upload_id
        #   ID of a COMPLETE Upload. The server reads the object from storage, copies its
        #   bytes into the entry, and marks the upload consumed.
        #
        #   @return [String, nil]
        optional :upload_id, String, api_name: :uploadId

        # @!method initialize(key:, content: nil, description: nil, upload_id: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::MemoryLayers::MemoryEntryCreateSpec} for more details.
        #
        #   MemoryEntryCreateSpec is the input shape for CreateMemoryEntry. It accepts
        #   either inline content or a reference to a completed Upload; exactly one of the
        #   two must be set.
        #
        #   @param key [String] See MemoryEntrySpec.key for the full rule set. Same constraints apply
        #
        #   @param content [String] Inline content, written directly into the entry.
        #
        #   @param description [String]
        #
        #   @param upload_id [String] ID of a COMPLETE Upload. The server reads the object from storage,
      end
    end
  end
end
