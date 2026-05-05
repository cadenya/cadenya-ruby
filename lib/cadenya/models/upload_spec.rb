# frozen_string_literal: true

module Cadenya
  module Models
    class UploadSpec < Cadenya::Internal::Type::BaseModel
      # @!attribute content_type
      #   MIME type the client will send. Baked into the presigned URL's signature — the
      #   PUT must match exactly or object storage will reject it.
      #
      #   @return [String]
      required :content_type, String, api_name: :contentType

      # @!attribute filename
      #   Client-supplied filename. Used for audit and display only; does not control the
      #   object's storage path.
      #
      #   @return [String]
      required :filename, String

      # @!attribute size_bytes
      #   Expected size of the upload in bytes. Baked into the presigned URL as a
      #   Content-Length constraint.
      #
      #   @return [String]
      required :size_bytes, String, api_name: :sizeBytes

      # @!method initialize(content_type:, filename:, size_bytes:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::UploadSpec} for more details.
      #
      #   @param content_type [String] MIME type the client will send. Baked into the presigned URL's signature
      #
      #   @param filename [String] Client-supplied filename. Used for audit and display only; does not
      #
      #   @param size_bytes [String] Expected size of the upload in bytes. Baked into the presigned URL as a
    end
  end
end
