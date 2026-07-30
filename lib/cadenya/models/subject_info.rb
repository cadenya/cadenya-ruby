# frozen_string_literal: true

module Cadenya
  module Models
    class SubjectInfo < Cadenya::Internal::Type::BaseModel
      response_only do
        # @!attribute objective_count
        #   Number of objectives associated with this subject.
        #
        #   @return [Integer, nil]
        optional :objective_count, Integer, api_name: :objectiveCount

        # @!attribute tenant
        #   TenantReference is the read-only echo of a resource's tenant association,
        #   carrying both Cadenya's canonical id and the customer's own key.
        #
        #   @return [Cadenya::Models::TenantReference, nil]
        optional :tenant, -> { Cadenya::TenantReference }
      end

      # @!method initialize(objective_count: nil, tenant: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::SubjectInfo} for more details.
      #
      #   SubjectInfo provides read-only server-derived data about a subject.
      #
      #   @param objective_count [Integer] Number of objectives associated with this subject.
      #
      #   @param tenant [Cadenya::Models::TenantReference] TenantReference is the read-only echo of a resource's tenant association,
    end
  end
end
