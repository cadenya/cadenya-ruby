# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Models#set_status
    class ModelSetStatusParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String]
      required :workspace_id, String

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute status
      #   The new status for the model
      #
      #   @return [Symbol, Cadenya::Models::ModelSetStatusParams::Status, nil]
      optional :status, enum: -> { Cadenya::ModelSetStatusParams::Status }

      # @!method initialize(workspace_id:, id:, status: nil, request_options: {})
      #   @param workspace_id [String]
      #
      #   @param id [String]
      #
      #   @param status [Symbol, Cadenya::Models::ModelSetStatusParams::Status] The new status for the model
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

      # The new status for the model
      module Status
        extend Cadenya::Internal::Type::Enum

        MODEL_STATUS_UNSPECIFIED = :MODEL_STATUS_UNSPECIFIED
        MODEL_STATUS_ENABLED = :MODEL_STATUS_ENABLED
        MODEL_STATUS_DISABLED = :MODEL_STATUS_DISABLED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
