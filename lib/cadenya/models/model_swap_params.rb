# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Models#swap
    class ModelSwapParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String]
      required :workspace_id, String

      # @!attribute model_swaps
      #   The swaps to perform.
      #
      #   @return [Array<Cadenya::Models::ModelSwapParams::ModelSwap>, nil]
      optional :model_swaps,
               -> { Cadenya::Internal::Type::ArrayOf[Cadenya::ModelSwapParams::ModelSwap] },
               api_name: :modelSwaps

      # @!method initialize(workspace_id:, model_swaps: nil, request_options: {})
      #   @param workspace_id [String]
      #
      #   @param model_swaps [Array<Cadenya::Models::ModelSwapParams::ModelSwap>] The swaps to perform.
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

      class ModelSwap < Cadenya::Internal::Type::BaseModel
        # @!attribute current_model_id
        #   The model variations are currently on. Accepts an id or "external_id:" slug.
        #
        #   @return [String, nil]
        optional :current_model_id, String, api_name: :currentModelId

        # @!attribute next_model_id
        #   The model to move variations to. Accepts an id or "external_id:" slug.
        #
        #   @return [String, nil]
        optional :next_model_id, String, api_name: :nextModelId

        # @!method initialize(current_model_id: nil, next_model_id: nil)
        #   @param current_model_id [String] The model variations are currently on. Accepts an id or "external_id:" slug.
        #
        #   @param next_model_id [String] The model to move variations to. Accepts an id or "external_id:" slug.
      end
    end
  end
end
