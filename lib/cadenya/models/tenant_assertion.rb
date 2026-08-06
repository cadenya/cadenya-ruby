# frozen_string_literal: true

module Cadenya
  module Models
    class TenantAssertion < Cadenya::Internal::Type::BaseModel
      # @!attribute id
      #   The tenant identifier in the customer's namespace (e.g. "acme-corp"). Stored as
      #   the tenant record's external_id; stable across requests.
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Optional human-readable name for the tenant. Updates the tenant record's name on
      #   every assertion that provides it.
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(id:, name: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::TenantAssertion} for more details.
      #
      #   TenantAssertion identifies a tenant in the customer's own namespace — their org,
      #   company, or team identifier for an end user. Asserting a tenant upserts the
      #   tenant record in the workspace (keyed on `id` as the tenant's external_id) and
      #   associates the created resource with it.
      #
      #   @param id [String] The tenant identifier in the customer's namespace (e.g. "acme-corp").
      #
      #   @param name [String] Optional human-readable name for the tenant. Updates the tenant record's
    end
  end
end
