# typed: strong

module Cadenya
  module Models
    class WidgetSession < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::WidgetSession, Cadenya::Internal::AnyHash)
        end

      # Metadata for ephemeral operations and activities (e.g., objectives, executions,
      # runs)
      sig { returns(Cadenya::OperationMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::OperationMetadata::OrHash).void }
      attr_writer :metadata

      # WidgetSessionSpec is the configuration of a session, fixed at mint.
      sig { returns(Cadenya::WidgetSessionSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::WidgetSessionSpec::OrHash).void }
      attr_writer :spec

      # WidgetSessionInfo provides read-only server-derived data about a session.
      sig { returns(T.nilable(Cadenya::WidgetSessionInfo)) }
      attr_reader :info

      sig { params(info: Cadenya::WidgetSessionInfo::OrHash).void }
      attr_writer :info

      # The current lifecycle state of the session. Output only. Sessions are created
      # STATE_ACTIVE; use :revoke to end one early.
      sig { returns(Cadenya::WidgetSession::State::TaggedSymbol) }
      attr_accessor :state

      # Names of the secrets attached to the session. Values are write-only: provided at
      # creation, encrypted at rest, and interpolated into tool-call headers server-side
      # — never returned by any API.
      sig { returns(T.nilable(T::Array[Cadenya::WidgetSession::Secret])) }
      attr_reader :secrets

      sig do
        params(secrets: T::Array[Cadenya::WidgetSession::Secret::OrHash]).void
      end
      attr_writer :secrets

      # WidgetSession is a delegated, narrowed credential for one visitor's use of a
      # widget, minted server-to-server by the customer's backend. The session carries
      # all customer-asserted context — tenant, subject, labels, secrets — and every
      # conversation (objective) created through the widget inherits it. The bearer
      # token returned at mint is short-lived and refreshed at the widget host; the
      # session row is what makes revocation possible.
      sig do
        params(
          metadata: Cadenya::OperationMetadata::OrHash,
          spec: Cadenya::WidgetSessionSpec::OrHash,
          state: Cadenya::WidgetSession::State::OrSymbol,
          info: Cadenya::WidgetSessionInfo::OrHash,
          secrets: T::Array[Cadenya::WidgetSession::Secret::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        metadata:,
        # WidgetSessionSpec is the configuration of a session, fixed at mint.
        spec:,
        # The current lifecycle state of the session. Output only. Sessions are created
        # STATE_ACTIVE; use :revoke to end one early.
        state:,
        # WidgetSessionInfo provides read-only server-derived data about a session.
        info: nil,
        # Names of the secrets attached to the session. Values are write-only: provided at
        # creation, encrypted at rest, and interpolated into tool-call headers server-side
        # — never returned by any API.
        secrets: nil
      )
      end

      sig do
        override.returns(
          {
            metadata: Cadenya::OperationMetadata,
            spec: Cadenya::WidgetSessionSpec,
            state: Cadenya::WidgetSession::State::TaggedSymbol,
            info: Cadenya::WidgetSessionInfo,
            secrets: T::Array[Cadenya::WidgetSession::Secret]
          }
        )
      end
      def to_hash
      end

      # The current lifecycle state of the session. Output only. Sessions are created
      # STATE_ACTIVE; use :revoke to end one early.
      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::WidgetSession::State) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(:STATE_UNSPECIFIED, Cadenya::WidgetSession::State::TaggedSymbol)
        STATE_ACTIVE =
          T.let(:STATE_ACTIVE, Cadenya::WidgetSession::State::TaggedSymbol)
        STATE_EXPIRED =
          T.let(:STATE_EXPIRED, Cadenya::WidgetSession::State::TaggedSymbol)
        STATE_REVOKED =
          T.let(:STATE_REVOKED, Cadenya::WidgetSession::State::TaggedSymbol)
        STATE_EXHAUSTED =
          T.let(:STATE_EXHAUSTED, Cadenya::WidgetSession::State::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::WidgetSession::State::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Secret < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::WidgetSession::Secret, Cadenya::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Secret is the name-only echo of a secret attached to the session. Values are
        # never returned.
        sig { params(name: String).returns(T.attached_class) }
        def self.new(name: nil)
        end

        sig { override.returns({ name: String }) }
        def to_hash
        end
      end
    end
  end
end
