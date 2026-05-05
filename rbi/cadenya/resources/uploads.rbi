# typed: strong

module Cadenya
  module Resources
    # Issue short-lived presigned URLs for direct client-to-object-storage uploads.
    # Created uploads can be referenced by id when creating or updating resources that
    # accept binary content (e.g., MemoryEntry).
    class Uploads
      # Issues a short-lived presigned URL for direct upload to object storage. The
      # returned id is used to reference the upload from resources that accept binary
      # content.
      sig do
        params(
          workspace_id: String,
          metadata: Cadenya::CreateResourceMetadata::OrHash,
          spec: Cadenya::UploadSpec::OrHash,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Upload)
      end
      def create(
        # Workspace ID.
        workspace_id,
        # CreateResourceMetadata contains the user-provided fields for creating a
        # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        # profile_id, created_at) are excluded since they are set by the server.
        metadata:,
        spec:,
        request_options: {}
      )
      end

      # Retrieves the current state of an upload, including its lifecycle status
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Upload)
      end
      def retrieve(
        id,
        # Workspace ID.
        workspace_id:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Cadenya::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
