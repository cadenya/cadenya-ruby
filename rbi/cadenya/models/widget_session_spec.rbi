# typed: strong

module Cadenya
  module Models
    class WidgetSessionSpec < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::WidgetSessionSpec, Cadenya::Internal::AnyHash)
        end

      # Widget this session is minted against. Accepts the canonical `wgt_…` form or the
      # `external_id:<value>` form.
      sig { returns(String) }
      attr_accessor :widget_id

      # Hard session expiry. Tokens never outlive it; after it passes the session
      # transitions to STATE_EXPIRED. Defaults to a server-chosen horizon when unset.
      sig { returns(T.nilable(Time)) }
      attr_reader :expires_at

      sig { params(expires_at: Time).void }
      attr_writer :expires_at

      # Parameters forced onto tool calls made by this session's conversations. A pinned
      # parameter is an overlay on a tool's JSON schema: the parameter is removed from
      # what the LLM sees, and its value is always overwritten server-side with the
      # pinned value — so the model cannot be tricked into calling a tool with a
      # different id than the one the session was minted for (e.g. pin "workspaceId" for
      # an OpenAPI tool with a /workspaces/{workspaceId} path). Flows to every objective
      # the session creates.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :pinned_parameters

      sig { params(pinned_parameters: T::Hash[Symbol, String]).void }
      attr_writer :pinned_parameters

      # SubjectAssertion identifies a person within a tenant in the customer's own
      # namespace — typically their user id. Asserting a subject upserts the subject
      # record under the asserted tenant and associates the created resource with it. A
      # subject assertion is only valid alongside a tenant assertion: subject
      # identifiers are scoped to their tenant.
      sig { returns(T.nilable(Cadenya::SubjectAssertion)) }
      attr_reader :subject

      sig { params(subject: Cadenya::SubjectAssertion::OrHash).void }
      attr_writer :subject

      # TenantAssertion identifies a tenant in the customer's own namespace — their org,
      # company, or team identifier for an end user. Asserting a tenant upserts the
      # tenant record in the workspace (keyed on `id` as the tenant's external_id) and
      # associates the created resource with it.
      sig { returns(T.nilable(Cadenya::TenantAssertion)) }
      attr_reader :tenant

      sig { params(tenant: Cadenya::TenantAssertion::OrHash).void }
      attr_writer :tenant

      # The session bearer token. Returned only on creation — subsequent reads omit it.
      # The token is short-lived; the widget refreshes it at the widget host without
      # involving the customer's backend.
      sig { returns(String) }
      attr_accessor :token

      # Expiry of the token returned in `token`. Distinct from `expires_at`, which
      # bounds the session itself.
      sig { returns(T.nilable(Time)) }
      attr_reader :token_expires_at

      sig { params(token_expires_at: Time).void }
      attr_writer :token_expires_at

      # WidgetSessionSpec is the configuration of a session, fixed at mint.
      sig do
        params(
          widget_id: String,
          token: String,
          expires_at: Time,
          pinned_parameters: T::Hash[Symbol, String],
          subject: Cadenya::SubjectAssertion::OrHash,
          tenant: Cadenya::TenantAssertion::OrHash,
          token_expires_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # Widget this session is minted against. Accepts the canonical `wgt_…` form or the
        # `external_id:<value>` form.
        widget_id:,
        # The session bearer token. Returned only on creation — subsequent reads omit it.
        # The token is short-lived; the widget refreshes it at the widget host without
        # involving the customer's backend.
        token:,
        # Hard session expiry. Tokens never outlive it; after it passes the session
        # transitions to STATE_EXPIRED. Defaults to a server-chosen horizon when unset.
        expires_at: nil,
        # Parameters forced onto tool calls made by this session's conversations. A pinned
        # parameter is an overlay on a tool's JSON schema: the parameter is removed from
        # what the LLM sees, and its value is always overwritten server-side with the
        # pinned value — so the model cannot be tricked into calling a tool with a
        # different id than the one the session was minted for (e.g. pin "workspaceId" for
        # an OpenAPI tool with a /workspaces/{workspaceId} path). Flows to every objective
        # the session creates.
        pinned_parameters: nil,
        # SubjectAssertion identifies a person within a tenant in the customer's own
        # namespace — typically their user id. Asserting a subject upserts the subject
        # record under the asserted tenant and associates the created resource with it. A
        # subject assertion is only valid alongside a tenant assertion: subject
        # identifiers are scoped to their tenant.
        subject: nil,
        # TenantAssertion identifies a tenant in the customer's own namespace — their org,
        # company, or team identifier for an end user. Asserting a tenant upserts the
        # tenant record in the workspace (keyed on `id` as the tenant's external_id) and
        # associates the created resource with it.
        tenant: nil,
        # Expiry of the token returned in `token`. Distinct from `expires_at`, which
        # bounds the session itself.
        token_expires_at: nil
      )
      end

      sig do
        override.returns(
          {
            widget_id: String,
            token: String,
            expires_at: Time,
            pinned_parameters: T::Hash[Symbol, String],
            subject: Cadenya::SubjectAssertion,
            tenant: Cadenya::TenantAssertion,
            token_expires_at: Time
          }
        )
      end
      def to_hash
      end
    end
  end
end
