# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Profiles#list
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
      #   Free-form search over profile name and email, for member-picker UIs.
      #
      #   @return [String, nil]
      optional :query, String

      # @!attribute type
      #   Filter by profile type. Defaults to all types when unset; pass PROFILE_TYPE_USER
      #   to list only human users (e.g. for a member picker).
      #
      #   @return [Symbol, Cadenya::Models::ProfileListParams::Type, nil]
      optional :type, enum: -> { Cadenya::ProfileListParams::Type }

      # @!method initialize(cursor: nil, limit: nil, query: nil, type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ProfileListParams} for more details.
      #
      #   @param cursor [String] Pagination cursor from previous response
      #
      #   @param limit [Integer] Maximum number of results to return
      #
      #   @param query [String] Free-form search over profile name and email, for member-picker UIs.
      #
      #   @param type [Symbol, Cadenya::Models::ProfileListParams::Type] Filter by profile type. Defaults to all types when unset; pass
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

      # Filter by profile type. Defaults to all types when unset; pass PROFILE_TYPE_USER
      # to list only human users (e.g. for a member picker).
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
