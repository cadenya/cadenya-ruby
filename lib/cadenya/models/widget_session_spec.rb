# frozen_string_literal: true

module Cadenya
  module Models
    class WidgetSessionSpec < Cadenya::Internal::Type::BaseModel
      # @!attribute widget_id
      #   Widget this session is minted against. Accepts the canonical `wgt_…` form or the
      #   `external_id:<value>` form.
      #
      #   @return [String]
      required :widget_id, String, api_name: :widgetId

      # @!attribute expires_at
      #   Hard session expiry. Tokens never outlive it; after it passes the session
      #   transitions to STATE_EXPIRED. Defaults to a server-chosen horizon when unset.
      #
      #   @return [Time, nil]
      optional :expires_at, Time, api_name: :expiresAt

      # @!attribute pinned_parameters
      #   Parameters forced onto tool calls made by this session's conversations. A pinned
      #   parameter is an overlay on a tool's JSON schema: the parameter is removed from
      #   what the LLM sees, and its value is always overwritten server-side with the
      #   pinned value — so the model cannot be tricked into calling a tool with a
      #   different id than the one the session was minted for (e.g. pin "workspaceId" for
      #   an OpenAPI tool with a /workspaces/{workspaceId} path). Flows to every objective
      #   the session creates.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :pinned_parameters, Cadenya::Internal::Type::HashOf[String], api_name: :pinnedParameters

      # @!attribute subject
      #   SubjectAssertion identifies a person within a tenant in the customer's own
      #   namespace — typically their user id. Asserting a subject upserts the subject
      #   record under the asserted tenant and associates the created resource with it. A
      #   subject assertion is only valid alongside a tenant assertion: subject
      #   identifiers are scoped to their tenant.
      #
      #   @return [Cadenya::Models::SubjectAssertion, nil]
      optional :subject, -> { Cadenya::SubjectAssertion }

      # @!attribute tenant
      #   TenantAssertion identifies a tenant in the customer's own namespace — their org,
      #   company, or team identifier for an end user. Asserting a tenant upserts the
      #   tenant record in the workspace (keyed on `id` as the tenant's external_id) and
      #   associates the created resource with it.
      #
      #   @return [Cadenya::Models::TenantAssertion, nil]
      optional :tenant, -> { Cadenya::TenantAssertion }

      response_only do
        # @!attribute token
        #   The session bearer token. Returned only on creation — subsequent reads omit it.
        #   The token is short-lived; the widget refreshes it at the widget host without
        #   involving the customer's backend.
        #
        #   @return [String]
        required :token, String

        # @!attribute token_expires_at
        #   Expiry of the token returned in `token`. Distinct from `expires_at`, which
        #   bounds the session itself.
        #
        #   @return [Time, nil]
        optional :token_expires_at, Time, api_name: :tokenExpiresAt
      end

      # @!method initialize(widget_id:, token:, expires_at: nil, pinned_parameters: nil, subject: nil, tenant: nil, token_expires_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::WidgetSessionSpec} for more details.
      #
      #   WidgetSessionSpec is the configuration of a session, fixed at mint.
      #
      #   @param widget_id [String] Widget this session is minted against. Accepts the canonical `wgt_…` form
      #
      #   @param token [String] The session bearer token. Returned only on creation — subsequent reads
      #
      #   @param expires_at [Time] Hard session expiry. Tokens never outlive it; after it passes the session
      #
      #   @param pinned_parameters [Hash{Symbol=>String}] Parameters forced onto tool calls made by this session's conversations.
      #
      #   @param subject [Cadenya::Models::SubjectAssertion] SubjectAssertion identifies a person within a tenant in the customer's own
      #
      #   @param tenant [Cadenya::Models::TenantAssertion] TenantAssertion identifies a tenant in the customer's own namespace — their
      #
      #   @param token_expires_at [Time] Expiry of the token returned in `token`. Distinct from `expires_at`,
    end
  end
end
