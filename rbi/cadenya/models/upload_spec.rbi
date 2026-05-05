# typed: strong

module Cadenya
  module Models
    class UploadSpec < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::UploadSpec, Cadenya::Internal::AnyHash) }

      # MIME type the client will send. Baked into the presigned URL's signature — the
      # PUT must match exactly or object storage will reject it.
      sig { returns(String) }
      attr_accessor :content_type

      # Client-supplied filename. Used for audit and display only; does not control the
      # object's storage path.
      sig { returns(String) }
      attr_accessor :filename

      # Expected size of the upload in bytes. Baked into the presigned URL as a
      # Content-Length constraint.
      sig { returns(String) }
      attr_accessor :size_bytes

      sig do
        params(
          content_type: String,
          filename: String,
          size_bytes: String
        ).returns(T.attached_class)
      end
      def self.new(
        # MIME type the client will send. Baked into the presigned URL's signature — the
        # PUT must match exactly or object storage will reject it.
        content_type:,
        # Client-supplied filename. Used for audit and display only; does not control the
        # object's storage path.
        filename:,
        # Expected size of the upload in bytes. Baked into the presigned URL as a
        # Content-Length constraint.
        size_bytes:
      )
      end

      sig do
        override.returns(
          { content_type: String, filename: String, size_bytes: String }
        )
      end
      def to_hash
      end
    end
  end
end
