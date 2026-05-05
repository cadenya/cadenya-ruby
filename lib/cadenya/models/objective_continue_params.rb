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

      # @!attribute secrets
      #   Secrets that should be included with the message. Helpful for when you need to
      #   update secrets on the objective (IE: A secret expires and needs to be refreshed)
      #
      #   @return [Array<Cadenya::Models::ObjectiveContinueParams::Secret>, nil]
      optional :secrets, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::ObjectiveContinueParams::Secret] }

      # @!method initialize(workspace_id:, objective_id:, enqueue: nil, message: nil, secrets: nil, request_options: {})
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
      #   @param secrets [Array<Cadenya::Models::ObjectiveContinueParams::Secret>] Secrets that should be included with the message. Helpful for when you need to u
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

      class Secret < Cadenya::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute value
        #
        #   @return [String, nil]
        optional :value, String

        # @!method initialize(name: nil, value: nil)
        #   @param name [String]
        #   @param value [String]
      end
    end
  end
end
