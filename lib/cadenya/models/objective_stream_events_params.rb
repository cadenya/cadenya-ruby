# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Objectives#stream_events_streaming
    class ObjectiveStreamEventsParams < Cadenya::Internal::Type::BaseModel
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

      # @!method initialize(workspace_id:, objective_id:, request_options: {})
      #   @param workspace_id [String]
      #   @param objective_id [String]
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
