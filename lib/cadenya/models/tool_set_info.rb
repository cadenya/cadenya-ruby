# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetInfo < Cadenya::Internal::Type::BaseModel
      # @!attribute available_tools
      #
      #   @return [Integer]
      required :available_tools, Integer, api_name: :availableTools

      # @!attribute created_by
      #   A profile identifies a user or non-human principal (such as an API key) at the
      #   account level. Profiles are account-scoped and can be granted access to multiple
      #   workspaces.
      #
      #   @return [Cadenya::Models::Profile, nil]
      optional :created_by, -> { Cadenya::Profile }, api_name: :createdBy

      # @!attribute omitted_tools
      #
      #   @return [Integer]
      required :omitted_tools, Integer, api_name: :omittedTools

      response_only do
        # @!attribute agent_count
        #
        #   @return [Integer]
        required :agent_count, Integer, api_name: :agentCount

        # @!attribute last_sync
        #
        #   @return [Time, nil]
        optional :last_sync, Time, api_name: :lastSync

        # @!attribute tool_count
        #
        #   @return [Integer]
        required :tool_count, Integer, api_name: :toolCount
      end

      # @!method initialize(agent_count:, available_tools:, created_by: nil, last_sync: nil, omitted_tools:, tool_count:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolSetInfo} for more details.
      #
      #   @param agent_count [Integer]
      #
      #   @param available_tools [Integer]
      #
      #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
      #
      #   @param last_sync [Time]
      #
      #   @param omitted_tools [Integer]
      #
      #   @param tool_count [Integer]
    end
  end
end
