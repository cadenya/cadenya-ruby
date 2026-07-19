# typed: strong

module Cadenya
  module Models
    class ToolSetUpdateParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetUpdateParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :workspace_id

      sig { params(workspace_id: String).void }
      attr_writer :workspace_id

      sig { returns(String) }
      attr_accessor :id

      # UpdateResourceMetadata contains the user-provided fields for updating a
      # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
      # profile_id, created_at) are excluded since they are set by the server.
      sig { returns(T.nilable(Cadenya::UpdateResourceMetadata)) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::UpdateResourceMetadata::OrHash).void }
      attr_writer :metadata

      sig { returns(T.nilable(Cadenya::ToolSetSpec)) }
      attr_reader :spec

      sig { params(spec: Cadenya::ToolSetSpec::OrHash).void }
      attr_writer :spec

      sig { returns(T.nilable(String)) }
      attr_reader :update_mask

      sig { params(update_mask: String).void }
      attr_writer :update_mask

      sig do
        params(
          id: String,
          workspace_id: String,
          metadata: Cadenya::UpdateResourceMetadata::OrHash,
          spec: Cadenya::ToolSetSpec::OrHash,
          update_mask: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        workspace_id: nil,
        # UpdateResourceMetadata contains the user-provided fields for updating a
        # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        # profile_id, created_at) are excluded since they are set by the server.
        metadata: nil,
        spec: nil,
        update_mask: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            id: String,
            metadata: Cadenya::UpdateResourceMetadata,
            spec: Cadenya::ToolSetSpec,
            update_mask: String,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
