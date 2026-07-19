# frozen_string_literal: true

module Cadenya
  module Resources
    # Issue short-lived presigned URLs for direct client-to-object-storage uploads.
    # Created uploads can be referenced by id when creating or updating resources that
    # accept binary content (e.g., MemoryEntry).
    class Uploads
      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::UploadCreateParams} for more details.
      #
      # Issues a short-lived presigned URL for direct upload to object storage. The
      # returned id is used to reference the upload from resources that accept binary
      # content.
      #
      # @overload create(metadata:, spec:, workspace_id: nil, request_options: {})
      #
      # @param metadata [Cadenya::Models::CreateResourceMetadata] Body param: CreateResourceMetadata contains the user-provided fields for creatin
      #
      # @param spec [Cadenya::Models::UploadSpec] Body param
      #
      # @param workspace_id [String] Path param: Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Upload]
      #
      # @see Cadenya::Models::UploadCreateParams
      def create(params)
        parsed, options = Cadenya::UploadCreateParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/uploads", workspace_id],
          body: parsed,
          model: Cadenya::Upload,
          options: options
        )
      end

      # Retrieves the current state of an upload, including its lifecycle status
      #
      # @overload retrieve(id, workspace_id: nil, request_options: {})
      #
      # @param id [String]
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Upload]
      #
      # @see Cadenya::Models::UploadRetrieveParams
      def retrieve(id, params = {})
        parsed, options = Cadenya::UploadRetrieveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/uploads/%2$s", workspace_id, id],
          model: Cadenya::Upload,
          options: options
        )
      end

      # @api private
      #
      # @param client [Cadenya::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
