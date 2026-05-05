# typed: strong

module Cadenya
  module Models
    class Upload < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::Upload, Cadenya::Internal::AnyHash) }

      sig { returns(Cadenya::UploadInfo) }
      attr_reader :info

      sig { params(info: Cadenya::UploadInfo::OrHash).void }
      attr_writer :info

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :metadata

      sig { returns(Cadenya::UploadSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::UploadSpec::OrHash).void }
      attr_writer :spec

      # A handle representing a single file upload flow. Clients call CreateUpload to
      # receive a short-lived presigned URL, PUT the file directly to object storage,
      # then reference the upload by id when creating or updating resources that accept
      # binary content.
      #
      # Uploads are one-shot: once consumed by a creating or updating resource the
      # upload transitions to UPLOAD_STATUS_CONSUMED and cannot be reused. Unused
      # uploads expire and are garbage-collected.
      sig do
        params(
          info: Cadenya::UploadInfo::OrHash,
          metadata: Cadenya::ResourceMetadata::OrHash,
          spec: Cadenya::UploadSpec::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        info:,
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        metadata:,
        spec:
      )
      end

      sig do
        override.returns(
          {
            info: Cadenya::UploadInfo,
            metadata: Cadenya::ResourceMetadata,
            spec: Cadenya::UploadSpec
          }
        )
      end
      def to_hash
      end
    end
  end
end
