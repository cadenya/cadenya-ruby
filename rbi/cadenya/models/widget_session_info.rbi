# typed: strong

module Cadenya
  module Models
    class WidgetSessionInfo < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::WidgetSessionInfo, Cadenya::Internal::AnyHash)
        end

      # BareMetadata contains the minimal metadata for a resource: the ID and an
      # optional human-readable name. These are used for reference fields where the full
      # metadata (account scoping, timestamps, labels, external IDs) is not needed —
      # e.g., the tool references inside an agent variation spec or the tools assigned
      # to an objective. Both fields are server-populated; clients provide IDs through
      # sibling fields rather than by constructing a BareMetadata themselves.
      sig { returns(T.nilable(Cadenya::BareMetadata)) }
      attr_reader :agent

      sig { params(agent: Cadenya::BareMetadata::OrHash).void }
      attr_writer :agent

      # The widget hostname this session's tokens are bound to. Authoritative — clients
      # must use this value rather than constructing the hostname.
      sig { returns(T.nilable(String)) }
      attr_reader :host

      sig { params(host: String).void }
      attr_writer :host

      # When the session last created a conversation, sent a message, or refreshed a
      # token.
      sig { returns(T.nilable(Time)) }
      attr_reader :last_active_at

      sig { params(last_active_at: Time).void }
      attr_writer :last_active_at

      # Number of conversation messages created through this session, counted against
      # the session's message cap.
      sig { returns(T.nilable(Integer)) }
      attr_reader :message_count

      sig { params(message_count: Integer).void }
      attr_writer :message_count

      # SubjectReference is the read-only echo of a resource's subject association,
      # carrying both Cadenya's canonical id and the customer's own key.
      sig { returns(T.nilable(Cadenya::SubjectReference)) }
      attr_reader :subject

      sig { params(subject: Cadenya::SubjectReference::OrHash).void }
      attr_writer :subject

      # TenantReference is the read-only echo of a resource's tenant association,
      # carrying both Cadenya's canonical id and the customer's own key.
      sig { returns(T.nilable(Cadenya::TenantReference)) }
      attr_reader :tenant

      sig { params(tenant: Cadenya::TenantReference::OrHash).void }
      attr_writer :tenant

      # BareMetadata contains the minimal metadata for a resource: the ID and an
      # optional human-readable name. These are used for reference fields where the full
      # metadata (account scoping, timestamps, labels, external IDs) is not needed —
      # e.g., the tool references inside an agent variation spec or the tools assigned
      # to an objective. Both fields are server-populated; clients provide IDs through
      # sibling fields rather than by constructing a BareMetadata themselves.
      sig { returns(T.nilable(Cadenya::BareMetadata)) }
      attr_reader :widget

      sig { params(widget: Cadenya::BareMetadata::OrHash).void }
      attr_writer :widget

      # WidgetSessionInfo provides read-only server-derived data about a session.
      sig do
        params(
          agent: Cadenya::BareMetadata::OrHash,
          host: String,
          last_active_at: Time,
          message_count: Integer,
          subject: Cadenya::SubjectReference::OrHash,
          tenant: Cadenya::TenantReference::OrHash,
          widget: Cadenya::BareMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # BareMetadata contains the minimal metadata for a resource: the ID and an
        # optional human-readable name. These are used for reference fields where the full
        # metadata (account scoping, timestamps, labels, external IDs) is not needed —
        # e.g., the tool references inside an agent variation spec or the tools assigned
        # to an objective. Both fields are server-populated; clients provide IDs through
        # sibling fields rather than by constructing a BareMetadata themselves.
        agent: nil,
        # The widget hostname this session's tokens are bound to. Authoritative — clients
        # must use this value rather than constructing the hostname.
        host: nil,
        # When the session last created a conversation, sent a message, or refreshed a
        # token.
        last_active_at: nil,
        # Number of conversation messages created through this session, counted against
        # the session's message cap.
        message_count: nil,
        # SubjectReference is the read-only echo of a resource's subject association,
        # carrying both Cadenya's canonical id and the customer's own key.
        subject: nil,
        # TenantReference is the read-only echo of a resource's tenant association,
        # carrying both Cadenya's canonical id and the customer's own key.
        tenant: nil,
        # BareMetadata contains the minimal metadata for a resource: the ID and an
        # optional human-readable name. These are used for reference fields where the full
        # metadata (account scoping, timestamps, labels, external IDs) is not needed —
        # e.g., the tool references inside an agent variation spec or the tools assigned
        # to an objective. Both fields are server-populated; clients provide IDs through
        # sibling fields rather than by constructing a BareMetadata themselves.
        widget: nil
      )
      end

      sig do
        override.returns(
          {
            agent: Cadenya::BareMetadata,
            host: String,
            last_active_at: Time,
            message_count: Integer,
            subject: Cadenya::SubjectReference,
            tenant: Cadenya::TenantReference,
            widget: Cadenya::BareMetadata
          }
        )
      end
      def to_hash
      end
    end
  end
end
