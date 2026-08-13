# frozen_string_literal: true

module Cadenya
  module Models
    class MemoryLayerInfo < Cadenya::Internal::Type::BaseModel
      # @!attribute created_by
      #   A profile identifies a user or non-human principal (such as an API key) at the
      #   account level. Profiles are account-scoped and can be granted access to multiple
      #   workspaces.
      #
      #   @return [Cadenya::Models::Profile, nil]
      optional :created_by, -> { Cadenya::Profile }, api_name: :createdBy

      response_only do
        # @!attribute agent
        #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @return [Cadenya::Models::ResourceMetadata, nil]
        optional :agent, -> { Cadenya::ResourceMetadata }

        # @!attribute entry_count
        #   Number of entries currently in this layer.
        #
        #   @return [Integer]
        required :entry_count, Integer, api_name: :entryCount

        # @!attribute last_used_at
        #   Timestamp of the most recent objective that resolved against this layer. Useful
        #   for surfacing unused layers in the dashboard.
        #
        #   @return [Time, nil]
        optional :last_used_at, Time, api_name: :lastUsedAt
      end

      # @!method initialize(agent: nil, created_by: nil, entry_count:, last_used_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::MemoryLayerInfo} for more details.
      #
      #   @param agent [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
      #
      #   @param entry_count [Integer] Number of entries currently in this layer.
      #
      #   @param last_used_at [Time] Timestamp of the most recent objective that resolved against this layer.
    end
  end
end
