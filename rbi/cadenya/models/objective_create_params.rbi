# typed: strong

module Cadenya
  module Models
    class ObjectiveCreateParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveCreateParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :workspace_id

      sig { returns(String) }
      attr_accessor :agent_id

      sig { returns(Cadenya::ObjectiveData) }
      attr_reader :data

      sig { params(data: Cadenya::ObjectiveData::OrHash).void }
      attr_writer :data

      # CreateOperationMetadata contains the user-provided fields for creating an
      # operation. Read-only fields (id, account_id, workspace_id, created_at,
      # profile_id) are excluded since they are set by the server.
      sig { returns(T.nilable(Cadenya::CreateOperationMetadata)) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::CreateOperationMetadata::OrHash).void }
      attr_writer :metadata

      # Optional explicit variation selection. Overrides the agent's
      # variation_selection_mode.
      sig { returns(T.nilable(String)) }
      attr_reader :variation_id

      sig { params(variation_id: String).void }
      attr_writer :variation_id

      sig do
        params(
          workspace_id: String,
          agent_id: String,
          data: Cadenya::ObjectiveData::OrHash,
          metadata: Cadenya::CreateOperationMetadata::OrHash,
          variation_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        workspace_id:,
        agent_id:,
        data:,
        # CreateOperationMetadata contains the user-provided fields for creating an
        # operation. Read-only fields (id, account_id, workspace_id, created_at,
        # profile_id) are excluded since they are set by the server.
        metadata: nil,
        # Optional explicit variation selection. Overrides the agent's
        # variation_selection_mode.
        variation_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            agent_id: String,
            data: Cadenya::ObjectiveData,
            metadata: Cadenya::CreateOperationMetadata,
            variation_id: String,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
