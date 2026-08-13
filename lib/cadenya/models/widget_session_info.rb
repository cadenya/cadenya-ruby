# frozen_string_literal: true

module Cadenya
  module Models
    class WidgetSessionInfo < Cadenya::Internal::Type::BaseModel
      response_only do
        # @!attribute agent
        #   BareMetadata contains the minimal metadata for a resource: the ID and an
        #   optional human-readable name. These are used for reference fields where the full
        #   metadata (account scoping, timestamps, labels, external IDs) is not needed —
        #   e.g., the tool references inside an agent variation spec or the tools assigned
        #   to an objective. Both fields are server-populated; clients provide IDs through
        #   sibling fields rather than by constructing a BareMetadata themselves.
        #
        #   @return [Cadenya::Models::BareMetadata]
        required :agent, -> { Cadenya::BareMetadata }

        # @!attribute host
        #   The widget hostname this session's tokens are bound to. Authoritative — clients
        #   must use this value rather than constructing the hostname.
        #
        #   @return [String]
        required :host, String

        # @!attribute last_active_at
        #   When the session last created a conversation, sent a message, or refreshed a
        #   token.
        #
        #   @return [Time, nil]
        optional :last_active_at, Time, api_name: :lastActiveAt

        # @!attribute message_count
        #   Number of conversation messages created through this session, counted against
        #   the session's message cap.
        #
        #   @return [Integer]
        required :message_count, Integer, api_name: :messageCount

        # @!attribute subject
        #   SubjectReference is the read-only echo of a resource's subject association,
        #   carrying both Cadenya's canonical id and the customer's own key.
        #
        #   @return [Cadenya::Models::SubjectReference, nil]
        optional :subject, -> { Cadenya::SubjectReference }

        # @!attribute tenant
        #   TenantReference is the read-only echo of a resource's tenant association,
        #   carrying both Cadenya's canonical id and the customer's own key.
        #
        #   @return [Cadenya::Models::TenantReference, nil]
        optional :tenant, -> { Cadenya::TenantReference }

        # @!attribute widget
        #   BareMetadata contains the minimal metadata for a resource: the ID and an
        #   optional human-readable name. These are used for reference fields where the full
        #   metadata (account scoping, timestamps, labels, external IDs) is not needed —
        #   e.g., the tool references inside an agent variation spec or the tools assigned
        #   to an objective. Both fields are server-populated; clients provide IDs through
        #   sibling fields rather than by constructing a BareMetadata themselves.
        #
        #   @return [Cadenya::Models::BareMetadata]
        required :widget, -> { Cadenya::BareMetadata }
      end

      # @!method initialize(agent:, host:, last_active_at: nil, message_count:, subject: nil, tenant: nil, widget:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::WidgetSessionInfo} for more details.
      #
      #   WidgetSessionInfo provides read-only server-derived data about a session.
      #
      #   @param agent [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
      #
      #   @param host [String] The widget hostname this session's tokens are bound to. Authoritative —
      #
      #   @param last_active_at [Time] When the session last created a conversation, sent a message, or
      #
      #   @param message_count [Integer] Number of conversation messages created through this session, counted
      #
      #   @param subject [Cadenya::Models::SubjectReference] SubjectReference is the read-only echo of a resource's subject association,
      #
      #   @param tenant [Cadenya::Models::TenantReference] TenantReference is the read-only echo of a resource's tenant association,
      #
      #   @param widget [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
    end
  end
end
