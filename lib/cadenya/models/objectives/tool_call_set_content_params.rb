# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      # @see Cadenya::Resources::Objectives::ToolCalls#set_content
      class ToolCallSetContentParams < Cadenya::Internal::Type::BaseModel
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

        # @!attribute tool_call_id
        #
        #   @return [String]
        required :tool_call_id, String

        # @!attribute content
        #   The content to set on the tool call. Mirrors
        #   ObjectiveToolCallResult.ContentBlock but writable: media blocks carry raw data
        #   on input where the result-side carries a signed url on output.
        #
        #   @return [Array<Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockText, Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockImage, Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockAudio>]
        required :content,
                 -> { Cadenya::Internal::Type::ArrayOf[union: Cadenya::Objectives::SetToolCallContentRequestContentBlock] }

        # @!method initialize(objective_id:, tool_call_id:, content:, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Objectives::ToolCallSetContentParams} for more details.
        #
        #   @param objective_id [String]
        #
        #   @param tool_call_id [String]
        #
        #   @param content [Array<Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockText, Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockImage, Cadenya::Models::Objectives::SetToolCallContentRequestContentBlockAudio>] The content to set on the tool call. Mirrors
        #
        #   @param workspace_id [String]
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
