# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::WidgetSessions#create
    class WidgetSession < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #   runs)
      #
      #   @return [Cadenya::Models::OperationMetadata]
      required :metadata, -> { Cadenya::OperationMetadata }

      # @!attribute spec
      #   WidgetSessionSpec is the configuration of a session, fixed at mint.
      #
      #   @return [Cadenya::Models::WidgetSessionSpec]
      required :spec, -> { Cadenya::WidgetSessionSpec }

      # @!attribute info
      #   WidgetSessionInfo provides read-only server-derived data about a session.
      #
      #   @return [Cadenya::Models::WidgetSessionInfo, nil]
      optional :info, -> { Cadenya::WidgetSessionInfo }

      response_only do
        # @!attribute state
        #   The current lifecycle state of the session. Output only. Sessions are created
        #   STATE_ACTIVE; use :revoke to end one early.
        #
        #   @return [Symbol, Cadenya::Models::WidgetSession::State]
        required :state, enum: -> { Cadenya::WidgetSession::State }

        # @!attribute secrets
        #   Names of the secrets attached to the session. Values are write-only: provided at
        #   creation, encrypted at rest, and interpolated into tool-call headers server-side
        #   — never returned by any API.
        #
        #   @return [Array<Cadenya::Models::WidgetSession::Secret>]
        required :secrets, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::WidgetSession::Secret] }
      end

      # @!method initialize(metadata:, spec:, state:, info: nil, secrets:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::WidgetSession} for more details.
      #
      #   WidgetSession is a delegated, narrowed credential for one visitor's use of a
      #   widget, minted server-to-server by the customer's backend. The session carries
      #   all customer-asserted context — tenant, subject, labels, secrets — and every
      #   conversation (objective) created through the widget inherits it. The bearer
      #   token returned at mint is short-lived and refreshed at the widget host; the
      #   session row is what makes revocation possible.
      #
      #   @param metadata [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #
      #   @param spec [Cadenya::Models::WidgetSessionSpec] WidgetSessionSpec is the configuration of a session, fixed at mint.
      #
      #   @param state [Symbol, Cadenya::Models::WidgetSession::State] The current lifecycle state of the session. Output only. Sessions are
      #
      #   @param info [Cadenya::Models::WidgetSessionInfo] WidgetSessionInfo provides read-only server-derived data about a session.
      #
      #   @param secrets [Array<Cadenya::Models::WidgetSession::Secret>] Names of the secrets attached to the session. Values are write-only:

      # The current lifecycle state of the session. Output only. Sessions are created
      # STATE_ACTIVE; use :revoke to end one early.
      #
      # @see Cadenya::Models::WidgetSession#state
      module State
        extend Cadenya::Internal::Type::Enum

        STATE_UNSPECIFIED = :STATE_UNSPECIFIED
        STATE_ACTIVE = :STATE_ACTIVE
        STATE_EXPIRED = :STATE_EXPIRED
        STATE_REVOKED = :STATE_REVOKED
        STATE_EXHAUSTED = :STATE_EXHAUSTED

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Secret < Cadenya::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(name: nil)
        #   Secret is the name-only echo of a secret attached to the session. Values are
        #   never returned.
        #
        #   @param name [String]
      end
    end
  end
end
