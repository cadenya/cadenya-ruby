# frozen_string_literal: true

module Cadenya
  module Models
    module MemoryLayers
      class MemoryEntryCreateSpecUploadID < Cadenya::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Cadenya::Models::MemoryLayers::MemoryEntryCreateSpecUploadID::Type]
        required :type, enum: -> { Cadenya::MemoryLayers::MemoryEntryCreateSpecUploadID::Type }

        # @!attribute upload_id
        #   ID of a COMPLETE Upload. The server reads the object from storage, copies its
        #   bytes into the entry, and marks the upload consumed.
        #
        #   @return [String]
        required :upload_id, String, api_name: :uploadId

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute key
        #   See MemoryEntrySpec.key for the full rule set. Same constraints apply here.
        #
        #   @return [String, nil]
        optional :key, String

        # @!method initialize(type:, upload_id:, description: nil, key: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::MemoryLayers::MemoryEntryCreateSpecUploadID} for more details.
        #
        #   @param type [Symbol, Cadenya::Models::MemoryLayers::MemoryEntryCreateSpecUploadID::Type]
        #
        #   @param upload_id [String] ID of a COMPLETE Upload. The server reads the object from storage,
        #
        #   @param description [String]
        #
        #   @param key [String] See MemoryEntrySpec.key for the full rule set. Same constraints apply

        # @see Cadenya::Models::MemoryLayers::MemoryEntryCreateSpecUploadID#type
        module Type
          extend Cadenya::Internal::Type::Enum

          UPLOAD_ID = :uploadId

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
