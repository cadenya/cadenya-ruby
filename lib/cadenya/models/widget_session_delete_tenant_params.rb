# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::WidgetSessions#delete_tenant
    class WidgetSessionDeleteTenantParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!attribute tenant_id
      #   Tenant whose sessions to delete. Required — an empty value is rejected rather
      #   than matching everything. Accepts the canonical `tenant_…` form or the
      #   `external_id:<value>` form.
      #
      #   @return [String, nil]
      optional :tenant_id, String

      # @!method initialize(workspace_id: nil, tenant_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::WidgetSessionDeleteTenantParams} for more details.
      #
      #   @param workspace_id [String]
      #
      #   @param tenant_id [String] Tenant whose sessions to delete. Required — an empty value is rejected
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
