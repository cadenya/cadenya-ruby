# frozen_string_literal: true

module Cadenya
  module Models
    class MemoryEntryItem < Cadenya::Internal::Type::BaseModel
      # @!attribute key
      #
      #   @return [String]
      required :key, String

      # @!attribute content
      #
      #   @return [String, nil]
      optional :content, String

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute upload_id
      #
      #   @return [String, nil]
      optional :upload_id, String, api_name: :uploadId

      # @!method initialize(key:, content: nil, description: nil, upload_id: nil)
      #   @param key [String]
      #   @param content [String]
      #   @param description [String]
      #   @param upload_id [String]
    end
  end
end
