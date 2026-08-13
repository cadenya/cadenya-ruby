# frozen_string_literal: true

module Cadenya
  module Models
    class TenantInfo < Cadenya::Internal::Type::BaseModel
      response_only do
        # @!attribute objective_count
        #   Number of objectives associated with this tenant, across every surface — widget
        #   conversations and objectives created directly against the API alike. This is the
        #   footprint a delete would destroy, which is why it is worth the count query that
        #   populating `info` costs.
        #
        #   @return [Integer]
        required :objective_count, Integer, api_name: :objectiveCount

        # @!attribute subject_count
        #   Number of subjects asserted under this tenant.
        #
        #   @return [Integer]
        required :subject_count, Integer, api_name: :subjectCount

        # @!attribute widget_session_count
        #   Number of widget sessions minted for this tenant that still exist.
        #
        #   @return [Integer]
        required :widget_session_count, Integer, api_name: :widgetSessionCount
      end

      # @!method initialize(objective_count:, subject_count:, widget_session_count:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::TenantInfo} for more details.
      #
      #   TenantInfo provides read-only server-derived data about a tenant.
      #
      #   @param objective_count [Integer] Number of objectives associated with this tenant, across every surface —
      #
      #   @param subject_count [Integer] Number of subjects asserted under this tenant.
      #
      #   @param widget_session_count [Integer] Number of widget sessions minted for this tenant that still exist.
    end
  end
end
