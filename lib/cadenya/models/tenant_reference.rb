# frozen_string_literal: true

module Cadenya
  module Models
    class TenantReference < Cadenya::Internal::Type::BaseModel
      response_only do
        # @!attribute id
        #   Cadenya's canonical tenant id.
        #
        #   @return [String]
        required :id, String

        # @!attribute external_id
        #   The tenant identifier in the customer's namespace, as asserted.
        #
        #   @return [String]
        required :external_id, String, api_name: :externalId

        # @!attribute name
        #   Human-readable name of the tenant, when one has been asserted.
        #
        #   @return [String, nil]
        optional :name, String
      end

      # @!method initialize(id:, external_id:, name: nil)
      #   TenantReference is the read-only echo of a resource's tenant association,
      #   carrying both Cadenya's canonical id and the customer's own key.
      #
      #   @param id [String] Cadenya's canonical tenant id.
      #
      #   @param external_id [String] The tenant identifier in the customer's namespace, as asserted.
      #
      #   @param name [String] Human-readable name of the tenant, when one has been asserted.
    end
  end
end
