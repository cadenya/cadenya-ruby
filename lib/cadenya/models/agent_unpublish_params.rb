# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Agents#unpublish
    class AgentUnpublishParams < Cadenya::Internal::Type::BaseModel
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

      # @!method initialize(workspace_id:, id:, request_options: {})
      #   @param workspace_id [String]
      #   @param id [String]
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
