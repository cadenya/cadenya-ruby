# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Objectives#continue
    class ObjectiveContinueParams < Cadenya::Internal::Type::BaseModel
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

      # @!attribute enqueue
      #   When set to true, the message will be enqueued for when the agent loop is
      #   available to process it.
      #
      #   @return [Boolean, nil]
      optional :enqueue, Cadenya::Internal::Type::Boolean

      # @!attribute message
      #   The message to continue an objective that has completed (or you are enqueing)
      #
      #   @return [String, nil]
      optional :message, String

      # @!method initialize(workspace_id:, objective_id:, enqueue: nil, message: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveContinueParams} for more details.
      #
      #   @param workspace_id [String]
      #
      #   @param objective_id [String]
      #
      #   @param enqueue [Boolean] When set to true, the message will be enqueued for when the agent loop is availa
      #
      #   @param message [String] The message to continue an objective that has completed (or you are enqueing)
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
