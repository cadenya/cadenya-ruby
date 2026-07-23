# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Objectives#stream_events_streaming
    class ObjectiveStreamEventsParams < Cadenya::Internal::Type::BaseModel
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

      # @!method initialize(objective_id:, workspace_id: nil, request_options: {})
      #   @param objective_id [String]
      #   @param workspace_id [String]
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
