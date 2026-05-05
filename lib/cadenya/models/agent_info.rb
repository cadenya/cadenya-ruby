# frozen_string_literal: true

module Cadenya
  module Models
    class AgentInfo < Cadenya::Internal::Type::BaseModel
      # @!attribute created_by
      #   A profile identifies a user or non-human principal (such as an API key) at the
      #   account level. Profiles are account-scoped and can be granted access to multiple
      #   workspaces.
      #
      #   @return [Cadenya::Models::Profile, nil]
      optional :created_by, -> { Cadenya::Profile }, api_name: :createdBy

      response_only do
        # @!attribute variation_count
        #
        #   @return [Integer, nil]
        optional :variation_count, Integer, api_name: :variationCount
      end

      # @!method initialize(created_by: nil, variation_count: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AgentInfo} for more details.
      #
      #   AgentInfo contains simple information about an agent for display or quick
      #   reference
      #
      #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
      #
      #   @param variation_count [Integer]
    end
  end
end
