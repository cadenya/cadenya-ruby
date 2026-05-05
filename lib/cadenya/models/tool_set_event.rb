# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::ToolSets#list_events
    class ToolSetEvent < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #   runs)
      #
      #   @return [Cadenya::Models::OperationMetadata]
      required :metadata, -> { Cadenya::OperationMetadata }

      # @!attribute event
      #   Event payload for a tool set operation.
      #
      #   @return [Cadenya::Models::ToolSetEventData, nil]
      optional :event, -> { Cadenya::ToolSetEventData }

      # @!attribute info
      #
      #   @return [Cadenya::Models::ToolSetEvent::Info, nil]
      optional :info, -> { Cadenya::ToolSetEvent::Info }

      response_only do
        # @!attribute tool_set_id
        #   The tool set this event is associated with.
        #
        #   @return [String, nil]
        optional :tool_set_id, String, api_name: :toolSetId
      end

      # @!method initialize(metadata:, event: nil, info: nil, tool_set_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolSetEvent} for more details.
      #
      #   A single event in the tool set's operation timeline.
      #
      #   @param metadata [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #
      #   @param event [Cadenya::Models::ToolSetEventData] Event payload for a tool set operation.
      #
      #   @param info [Cadenya::Models::ToolSetEvent::Info]
      #
      #   @param tool_set_id [String] The tool set this event is associated with.

      # @see Cadenya::Models::ToolSetEvent#info
      class Info < Cadenya::Internal::Type::BaseModel
        # @!attribute created_by
        #   A profile identifies a user or non-human principal (such as an API key) at the
        #   account level. Profiles are account-scoped and can be granted access to multiple
        #   workspaces.
        #
        #   @return [Cadenya::Models::Profile, nil]
        optional :created_by, -> { Cadenya::Profile }, api_name: :createdBy

        # @!attribute tool_set
        #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @return [Cadenya::Models::ResourceMetadata, nil]
        optional :tool_set, -> { Cadenya::ResourceMetadata }, api_name: :toolSet

        # @!method initialize(created_by: nil, tool_set: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ToolSetEvent::Info} for more details.
        #
        #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
        #
        #   @param tool_set [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      end
    end
  end
end
