# typed: strong

module Cadenya
  module Models
    module Objectives
      class FeedbackCreateParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::FeedbackCreateParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        sig { returns(String) }
        attr_accessor :objective_id

        sig { returns(Cadenya::Objectives::ObjectiveFeedbackData) }
        attr_reader :data

        sig do
          params(data: Cadenya::Objectives::ObjectiveFeedbackData::OrHash).void
        end
        attr_writer :data

        # CreateOperationMetadata contains the user-provided fields for creating an
        # operation. Read-only fields (id, account_id, workspace_id, created_at,
        # profile_id) are excluded since they are set by the server.
        sig { returns(Cadenya::CreateOperationMetadata) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::CreateOperationMetadata::OrHash).void }
        attr_writer :metadata

        sig do
          params(
            workspace_id: String,
            objective_id: String,
            data: Cadenya::Objectives::ObjectiveFeedbackData::OrHash,
            metadata: Cadenya::CreateOperationMetadata::OrHash,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          workspace_id:,
          objective_id:,
          data:,
          # CreateOperationMetadata contains the user-provided fields for creating an
          # operation. Read-only fields (id, account_id, workspace_id, created_at,
          # profile_id) are excluded since they are set by the server.
          metadata:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              objective_id: String,
              data: Cadenya::Objectives::ObjectiveFeedbackData,
              metadata: Cadenya::CreateOperationMetadata,
              request_options: Cadenya::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
