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
        #   empty returns all profiles (subject to the type filter).
        #
        #   @return [String, nil]
        optional :query, String

        # @!attribute type
        #   Filter by profile type. Defaults to all types when unset; pass PROFILE_TYPE_USER
        #   to list only human users (the common case for a member picker).
        #
        #   @return [Symbol, Cadenya::Models::WorkspaceAdmin::ProfileListParams::Type, nil]
        optional :type, enum: -> { Cadenya::WorkspaceAdmin::ProfileListParams::Type }

        # @!method initialize(cursor: nil, limit: nil, query: nil, type: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::WorkspaceAdmin::ProfileListParams} for more details.
        #
        #   @param cursor [String] Pagination cursor from previous response
        #
        #   @param limit [Integer] Maximum number of results to return
        #
        #   @param query [String] Free-form search over profile name and email. Case-insensitive substring
        #
        #   @param type [Symbol, Cadenya::Models::WorkspaceAdmin::ProfileListParams::Type] Filter by profile type. Defaults to all types when unset; pass
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

        # Filter by profile type. Defaults to all types when unset; pass PROFILE_TYPE_USER
        # to list only human users (the common case for a member picker).
        module Type
          extend Cadenya::Internal::Type::Enum

          PROFILE_TYPE_USER = :PROFILE_TYPE_USER
          PROFILE_TYPE_API_KEY = :PROFILE_TYPE_API_KEY
          PROFILE_TYPE_SYSTEM = :PROFILE_TYPE_SYSTEM

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
