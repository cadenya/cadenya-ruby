# typed: strong

module Cadenya
  module Models
    class UploadInfo < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::UploadInfo, Cadenya::Internal::AnyHash) }

      # A profile identifies a user or non-human principal (such as an API key) at the
      # account level. Profiles are account-scoped and can be granted access to multiple
      # workspaces.
      sig { returns(T.nilable(Cadenya::Profile)) }
      attr_reader :created_by

      sig { params(created_by: Cadenya::Profile::OrHash).void }
      attr_writer :created_by

      # Lifecycle state. Transitions PENDING → COMPLETE (storage confirms the object
      # exists) → CONSUMED (a resource referenced this upload), or → EXPIRED (URL
      # elapsed without a PUT).
      sig { returns(Cadenya::UploadInfo::Status::TaggedSymbol) }
      attr_accessor :status

      # Presigned PUT URL. Short-lived. The client must PUT with the exact Content-Type
      # declared in the spec, and the body length must match size_bytes.
      sig { returns(String) }
      attr_accessor :upload_url

      # Absolute time at which upload_url stops working.
      sig { returns(T.nilable(Time)) }
      attr_reader :upload_url_expires_at

      sig { params(upload_url_expires_at: Time).void }
      attr_writer :upload_url_expires_at

      sig do
        params(
          status: Cadenya::UploadInfo::Status::OrSymbol,
          upload_url: String,
          created_by: Cadenya::Profile::OrHash,
          upload_url_expires_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # Lifecycle state. Transitions PENDING → COMPLETE (storage confirms the object
        # exists) → CONSUMED (a resource referenced this upload), or → EXPIRED (URL
        # elapsed without a PUT).
        status:,
        # Presigned PUT URL. Short-lived. The client must PUT with the exact Content-Type
        # declared in the spec, and the body length must match size_bytes.
        upload_url:,
        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        created_by: nil,
        # Absolute time at which upload_url stops working.
        upload_url_expires_at: nil
      )
      end

      sig do
        override.returns(
          {
            created_by: Cadenya::Profile,
            status: Cadenya::UploadInfo::Status::TaggedSymbol,
            upload_url: String,
            upload_url_expires_at: Time
          }
        )
      end
      def to_hash
      end

      # Lifecycle state. Transitions PENDING → COMPLETE (storage confirms the object
      # exists) → CONSUMED (a resource referenced this upload), or → EXPIRED (URL
      # elapsed without a PUT).
      module Status
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::UploadInfo::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        UPLOAD_STATUS_UNSPECIFIED =
          T.let(
            :UPLOAD_STATUS_UNSPECIFIED,
            Cadenya::UploadInfo::Status::TaggedSymbol
          )
        UPLOAD_STATUS_PENDING =
          T.let(
            :UPLOAD_STATUS_PENDING,
            Cadenya::UploadInfo::Status::TaggedSymbol
          )
        UPLOAD_STATUS_COMPLETE =
          T.let(
            :UPLOAD_STATUS_COMPLETE,
            Cadenya::UploadInfo::Status::TaggedSymbol
          )
        UPLOAD_STATUS_CONSUMED =
          T.let(
            :UPLOAD_STATUS_CONSUMED,
            Cadenya::UploadInfo::Status::TaggedSymbol
          )
        UPLOAD_STATUS_EXPIRED =
          T.let(
            :UPLOAD_STATUS_EXPIRED,
            Cadenya::UploadInfo::Status::TaggedSymbol
          )

        sig do
          override.returns(T::Array[Cadenya::UploadInfo::Status::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
