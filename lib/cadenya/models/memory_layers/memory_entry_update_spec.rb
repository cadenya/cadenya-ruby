# frozen_string_literal: true

module Cadenya
  module Models
    module MemoryLayers
      class MemoryEntryUpdateSpec < Cadenya::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [String, nil]
        optional :content, String

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute key
        #
        #   @return [String, nil]
        optional :key, String

        # @!attribute upload_id
        #
        #   @return [String, nil]
        optional :upload_id, String, api_name: :uploadId

        # @!method initialize(content: nil, description: nil, key: nil, upload_id: nil)
        #   MemoryEntryUpdateSpec is the input shape for UpdateMemoryEntry. Fields present
        #   in the request's update_mask are applied; unset fields are left alone. The
        #   source oneof is optional for updates — omit it to leave the body untouched, or
        #   set exactly one branch to replace it.
        #
        #   @param content [String]
        #   @param description [String]
        #   @param key [String]
        #   @param upload_id [String]
      end
    end
  end
end
