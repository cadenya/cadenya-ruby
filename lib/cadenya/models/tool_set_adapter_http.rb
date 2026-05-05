# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetAdapterHTTP < Cadenya::Internal::Type::BaseModel
      # @!attribute base_url
      #
      #   @return [String, nil]
      optional :base_url, String, api_name: :baseUrl

      # @!attribute headers
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, Cadenya::Internal::Type::HashOf[String]

      # @!method initialize(base_url: nil, headers: nil)
      #   @param base_url [String]
      #   @param headers [Hash{Symbol=>String}]
    end
  end
end
