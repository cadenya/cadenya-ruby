# typed: strong

module Cadenya
  module Models
    class WidgetSessionCreateParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::WidgetSessionCreateParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :workspace_id

      sig { params(workspace_id: String).void }
      attr_writer :workspace_id

      # WidgetSessionSpec is the configuration of a session, fixed at mint.
      sig { returns(Cadenya::WidgetSessionSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::WidgetSessionSpec::OrHash).void }
      attr_writer :spec

      # CreateOperationMetadata contains the user-provided fields for creating an
      # operation. Read-only fields (id, account_id, workspace_id, created_at,
      # profile_id) are excluded since they are set by the server.
      sig { returns(T.nilable(Cadenya::CreateOperationMetadata)) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::CreateOperationMetadata::OrHash).void }
      attr_writer :metadata

      # Secrets to attach to the session.
      sig do
        returns(T.nilable(T::Array[Cadenya::WidgetSessionCreateParams::Secret]))
      end
      attr_reader :secrets

      sig do
        params(
          secrets: T::Array[Cadenya::WidgetSessionCreateParams::Secret::OrHash]
        ).void
      end
      attr_writer :secrets

      sig do
        params(
          spec: Cadenya::WidgetSessionSpec::OrHash,
          workspace_id: String,
          metadata: Cadenya::CreateOperationMetadata::OrHash,
          secrets: T::Array[Cadenya::WidgetSessionCreateParams::Secret::OrHash],
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # WidgetSessionSpec is the configuration of a session, fixed at mint.
        spec:,
        workspace_id: nil,
        # CreateOperationMetadata contains the user-provided fields for creating an
        # operation. Read-only fields (id, account_id, workspace_id, created_at,
        # profile_id) are excluded since they are set by the server.
        metadata: nil,
        # Secrets to attach to the session.
        secrets: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            spec: Cadenya::WidgetSessionSpec,
            metadata: Cadenya::CreateOperationMetadata,
            secrets: T::Array[Cadenya::WidgetSessionCreateParams::Secret],
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Secret < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::WidgetSessionCreateParams::Secret,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { returns(T.nilable(String)) }
        attr_reader :value

        sig { params(value: String).void }
        attr_writer :value

        # Secret is a named credential attached to the session — typically a token the
        # customer's backend minted for the visitor, so the agent acts against their API
        # as that subject. Values are captured at the boundary, encrypted at rest,
        # appended to every conversation the session creates (re-synced on each turn), and
        # never returned by any API. Session secrets take precedence over workspace and
        # tool-set secrets of the same name.
        sig { params(name: String, value: String).returns(T.attached_class) }
        def self.new(name: nil, value: nil)
        end

        sig { override.returns({ name: String, value: String }) }
        def to_hash
        end
      end
    end
  end
end
