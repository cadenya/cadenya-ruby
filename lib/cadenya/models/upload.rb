# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Uploads#create
    class Upload < Cadenya::Internal::Type::BaseModel
      # @!attribute info
      #
      #   @return [Cadenya::Models::UploadInfo]
      required :info, -> { Cadenya::UploadInfo }

      # @!attribute metadata
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata]
      required :metadata, -> { Cadenya::ResourceMetadata }

      # @!attribute spec
      #
      #   @return [Cadenya::Models::UploadSpec]
      required :spec, -> { Cadenya::UploadSpec }

      # @!method initialize(info:, metadata:, spec:)
      #   Some parameter documentations has been truncated, see {Cadenya::Models::Upload}
      #   for more details.
      #
      #   A handle representing a single file upload flow. Clients call CreateUpload to
      #   receive a short-lived presigned URL, PUT the file directly to object storage,
      #   then reference the upload by id when creating or updating resources that accept
      #   binary content.
      #
      #   Uploads are one-shot: once consumed by a creating or updating resource the
      #   upload transitions to UPLOAD_STATUS_CONSUMED and cannot be reused. Unused
      #   uploads expire and are garbage-collected.
      #
      #   @param info [Cadenya::Models::UploadInfo]
      #
      #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param spec [Cadenya::Models::UploadSpec]
    end
  end
end
