# frozen_string_literal: true

module Cadenya
  module Models
    module WorkspaceAdmin
      # @see Cadenya::Resources::WorkspaceAdmin::Profiles#list
      class ProfileListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute cursor
        #   Pagination cursor from previous response
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute limit
        #   Maximum number of results to return
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute query
        #   Free-form search over profile name and email. Case-insensitive substring match;
        #   empty returns all profiles.
        #
        #   @return [String, nil]
        optional :query, String

        # @!method initialize(cursor: nil, limit: nil, query: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::WorkspaceAdmin::ProfileListParams} for more details.
        #
        #   @param cursor [String] Pagination cursor from previous response
        #
        #   @param limit [Integer] Maximum number of results to return
        #
        #   @param query [String] Free-form search over profile name and email. Case-insensitive substring
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
