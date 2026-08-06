# frozen_string_literal: true

module Cadenya
  module Models
    class WidgetInfo < Cadenya::Internal::Type::BaseModel
      # @!attribute created_by
      #   A profile identifies a user or non-human principal (such as an API key) at the
      #   account level. Profiles are account-scoped and can be granted access to multiple
      #   workspaces.
      #
      #   @return [Cadenya::Models::Profile, nil]
      optional :created_by, -> { Cadenya::Profile }, api_name: :createdBy

      response_only do
        # @!attribute agent
        #   BareMetadata contains the minimal metadata for a resource: the ID and an
        #   optional human-readable name. These are used for reference fields where the full
        #   metadata (account scoping, timestamps, labels, external IDs) is not needed —
        #   e.g., the tool references inside an agent variation spec or the tools assigned
        #   to an objective. Both fields are server-populated; clients provide IDs through
        #   sibling fields rather than by constructing a BareMetadata themselves.
        #
        #   @return [Cadenya::Models::BareMetadata, nil]
        optional :agent, -> { Cadenya::BareMetadata }

        # @!attribute dns_label
        #   The widget's DNS label — the single hostname label under the widgets domain.
        #   Server-generated at creation, globally unique, immutable, and deliberately
        #   unrelated to the widget's id.
        #
        #   @return [String, nil]
        optional :dns_label, String, api_name: :dnsLabel

        # @!attribute host
        #   The full hostname browsers talk to. Authoritative — clients must use this value
        #   rather than constructing the hostname themselves.
        #
        #   @return [String, nil]
        optional :host, String
      end

      # @!method initialize(agent: nil, created_by: nil, dns_label: nil, host: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::WidgetInfo} for more details.
      #
      #   WidgetInfo provides read-only server-derived data about a widget.
      #
      #   @param agent [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
      #
      #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
      #
      #   @param dns_label [String] The widget's DNS label — the single hostname label under the widgets
      #
      #   @param host [String] The full hostname browsers talk to. Authoritative — clients must use this
    end
  end
end
