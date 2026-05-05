# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetInfo < Cadenya::Internal::Type::BaseModel
      # @!attribute created_by
      #   A profile identifies a user or non-human principal (such as an API key) at the
      #   account level. Profiles are account-scoped and can be granted access to multiple
      #   workspaces.
      #
      #   @return [Cadenya::Models::Profile, nil]
      optional :created_by, -> { Cadenya::Profile }, api_name: :createdBy

      response_only do
        # @!attribute agent_count
        #
        #   @return [Integer, nil]
        optional :agent_count, Integer, api_name: :agentCount

        # @!attribute last_sync
        #
        #   @return [Time, nil]
        optional :last_sync, Time, api_name: :lastSync

        # @!attribute tool_count
        #
        #   @return [Integer, nil]
        optional :tool_count, Integer, api_name: :toolCount
      end

      # @!method initialize(agent_count: nil, created_by: nil, last_sync: nil, tool_count: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolSetInfo} for more details.
      #
      #   @param agent_count [Integer]
      #
      #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
      #
      #   @param last_sync [Time]
      #
      #   @param tool_count [Integer]
    end
  end
end
