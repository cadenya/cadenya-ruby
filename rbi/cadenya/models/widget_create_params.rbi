# typed: strong

module Cadenya
  module Models
    class WidgetCreateParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::WidgetCreateParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :workspace_id

      sig { params(workspace_id: String).void }
      attr_writer :workspace_id

      # CreateResourceMetadata contains the user-provided fields for creating a
      # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
      # profile_id, created_at) are excluded since they are set by the server.
      sig { returns(Cadenya::CreateResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::CreateResourceMetadata::OrHash).void }
      attr_writer :metadata

      # WidgetSpec is the user-provided configuration for a widget.
      sig { returns(Cadenya::WidgetSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::WidgetSpec::OrHash).void }
      attr_writer :spec

      sig do
        params(
          metadata: Cadenya::CreateResourceMetadata::OrHash,
          spec: Cadenya::WidgetSpec::OrHash,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # CreateResourceMetadata contains the user-provided fields for creating a
        # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        # profile_id, created_at) are excluded since they are set by the server.
        metadata:,
        # WidgetSpec is the user-provided configuration for a widget.
        spec:,
        workspace_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            metadata: Cadenya::CreateResourceMetadata,
            spec: Cadenya::WidgetSpec,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
