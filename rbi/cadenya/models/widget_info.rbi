# typed: strong

module Cadenya
  module Models
    class WidgetInfo < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::WidgetInfo, Cadenya::Internal::AnyHash) }

      # A profile identifies a user or non-human principal (such as an API key) at the
      # account level. Profiles are account-scoped and can be granted access to multiple
      # workspaces.
      sig { returns(T.nilable(Cadenya::Profile)) }
      attr_reader :created_by

      sig { params(created_by: Cadenya::Profile::OrHash).void }
      attr_writer :created_by

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

      # The widget's DNS label — the single hostname label under the widgets domain.
      # Server-generated at creation, globally unique, immutable, and deliberately
      # unrelated to the widget's id.
      sig { returns(T.nilable(String)) }
      attr_reader :dns_label

      sig { params(dns_label: String).void }
      attr_writer :dns_label

      # The full hostname browsers talk to. Authoritative — clients must use this value
      # rather than constructing the hostname themselves.
      sig { returns(T.nilable(String)) }
      attr_reader :host

      sig { params(host: String).void }
      attr_writer :host

      # WidgetInfo provides read-only server-derived data about a widget.
      sig do
        params(
          agent: Cadenya::BareMetadata::OrHash,
          created_by: Cadenya::Profile::OrHash,
          dns_label: String,
          host: String
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
        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        created_by: nil,
        # The widget's DNS label — the single hostname label under the widgets domain.
        # Server-generated at creation, globally unique, immutable, and deliberately
        # unrelated to the widget's id.
        dns_label: nil,
        # The full hostname browsers talk to. Authoritative — clients must use this value
        # rather than constructing the hostname themselves.
        host: nil
      )
      end

      sig do
        override.returns(
          {
            agent: Cadenya::BareMetadata,
            created_by: Cadenya::Profile,
            dns_label: String,
            host: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
