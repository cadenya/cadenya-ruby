# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Agents#delete
    class AgentDeleteParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:, workspace_id: nil, request_options: {})
      #   @param id [String]
      #   @param workspace_id [String]
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
