# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      # @see Cadenya::Resources::Objectives::Feedback#create
      class FeedbackCreateParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String, nil]
        optional :workspace_id, String

        # @!attribute objective_id
        #
        #   @return [String]
        required :objective_id, String

        # @!attribute data
        #
        #   @return [Cadenya::Models::Objectives::ObjectiveFeedbackData]
        required :data, -> { Cadenya::Objectives::ObjectiveFeedbackData }

        # @!attribute metadata
        #   CreateOperationMetadata contains the user-provided fields for creating an
        #   operation. Read-only fields (id, account_id, workspace_id, created_at,
        #   profile_id) are excluded since they are set by the server.
        #
        #   @return [Cadenya::Models::CreateOperationMetadata]
        required :metadata, -> { Cadenya::CreateOperationMetadata }

        # @!method initialize(objective_id:, data:, metadata:, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Objectives::FeedbackCreateParams} for more details.
        #
        #   @param objective_id [String]
        #
        #   @param data [Cadenya::Models::Objectives::ObjectiveFeedbackData]
        #
        #   @param metadata [Cadenya::Models::CreateOperationMetadata] CreateOperationMetadata contains the user-provided fields for creating
        #
        #   @param workspace_id [String]
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
