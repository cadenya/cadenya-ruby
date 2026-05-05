# typed: strong

module Cadenya
  module Models
    class BulkWorkspaceResourceApplyParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Cadenya::BulkWorkspaceResourceApplyParams,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :workspace_id

      sig { returns(Cadenya::BulkWorkspaceApplyData) }
      attr_reader :data

      sig { params(data: Cadenya::BulkWorkspaceApplyData::OrHash).void }
      attr_writer :data

      sig do
        params(
          workspace_id: String,
          data: Cadenya::BulkWorkspaceApplyData::OrHash,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(workspace_id:, data:, request_options: {})
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            data: Cadenya::BulkWorkspaceApplyData,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
