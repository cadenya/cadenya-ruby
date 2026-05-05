# frozen_string_literal: true

module Cadenya
  module Models
    class UploadInfo < Cadenya::Internal::Type::BaseModel
      # @!attribute created_by
      #   A profile identifies a user or non-human principal (such as an API key) at the
      #   account level. Profiles are account-scoped and can be granted access to multiple
      #   workspaces.
      #
      #   @return [Cadenya::Models::Profile, nil]
      optional :created_by, -> { Cadenya::Profile }, api_name: :createdBy

      response_only do
        # @!attribute status
        #   Lifecycle state. Transitions PENDING → COMPLETE (storage confirms the object
        #   exists) → CONSUMED (a resource referenced this upload), or → EXPIRED (URL
        #   elapsed without a PUT).
        #
        #   @return [Symbol, Cadenya::Models::UploadInfo::Status, nil]
        optional :status, enum: -> { Cadenya::UploadInfo::Status }

        # @!attribute upload_url
        #   Presigned PUT URL. Short-lived. The client must PUT with the exact Content-Type
        #   declared in the spec, and the body length must match size_bytes.
        #
        #   @return [String, nil]
        optional :upload_url, String, api_name: :uploadUrl

        # @!attribute upload_url_expires_at
        #   Absolute time at which upload_url stops working.
        #
        #   @return [Time, nil]
        optional :upload_url_expires_at, Time, api_name: :uploadUrlExpiresAt
      end

      # @!method initialize(created_by: nil, status: nil, upload_url: nil, upload_url_expires_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::UploadInfo} for more details.
      #
      #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
      #
      #   @param status [Symbol, Cadenya::Models::UploadInfo::Status] Lifecycle state. Transitions PENDING → COMPLETE (storage confirms the
      #
      #   @param upload_url [String] Presigned PUT URL. Short-lived. The client must PUT with the exact
      #
      #   @param upload_url_expires_at [Time] Absolute time at which upload_url stops working.

      # Lifecycle state. Transitions PENDING → COMPLETE (storage confirms the object
      # exists) → CONSUMED (a resource referenced this upload), or → EXPIRED (URL
      # elapsed without a PUT).
      #
      # @see Cadenya::Models::UploadInfo#status
      module Status
        extend Cadenya::Internal::Type::Enum

        UPLOAD_STATUS_UNSPECIFIED = :UPLOAD_STATUS_UNSPECIFIED
        UPLOAD_STATUS_PENDING = :UPLOAD_STATUS_PENDING
        UPLOAD_STATUS_COMPLETE = :UPLOAD_STATUS_COMPLETE
        UPLOAD_STATUS_CONSUMED = :UPLOAD_STATUS_CONSUMED
        UPLOAD_STATUS_EXPIRED = :UPLOAD_STATUS_EXPIRED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
