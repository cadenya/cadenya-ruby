# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Objectives#cancel
    class ObjectiveCancelParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String]
      required :workspace_id, String

      # @!attribute objective_id
      #
      #   @return [String]
      required :objective_id, String

      # @!attribute reason
      #   Optional reason for cancellation
      #
      #   @return [String, nil]
      optional :reason, String

      # @!method initialize(workspace_id:, objective_id:, reason: nil, request_options: {})
      #   @param workspace_id [String]
      #
      #   @param objective_id [String]
      #
      #   @param reason [String] Optional reason for cancellation
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
