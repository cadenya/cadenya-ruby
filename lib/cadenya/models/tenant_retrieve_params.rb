# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Tenants#retrieve
    class TenantRetrieveParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute include_info
      #   When true, the `info` field is populated.
      #
      #   @return [Boolean, nil]
      optional :include_info, Cadenya::Internal::Type::Boolean

      # @!method initialize(id:, workspace_id: nil, include_info: nil, request_options: {})
      #   @param id [String]
      #
      #   @param workspace_id [String]
      #
      #   @param include_info [Boolean] When true, the `info` field is populated.
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
