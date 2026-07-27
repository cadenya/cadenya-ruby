# frozen_string_literal: true

module Cadenya
  module Models
    class SubjectReference < Cadenya::Internal::Type::BaseModel
      response_only do
        # @!attribute id
        #   Cadenya's canonical subject id.
        #
        #   @return [String]
        required :id, String

        # @!attribute external_id
        #   The subject identifier in the customer's namespace, as asserted. Unique within
        #   the subject's tenant.
        #
        #   @return [String]
        required :external_id, String, api_name: :externalId

        # @!attribute name
        #   Human-readable name of the subject, when one has been asserted.
        #
        #   @return [String, nil]
        optional :name, String
      end

      # @!method initialize(id:, external_id:, name: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::SubjectReference} for more details.
      #
      #   SubjectReference is the read-only echo of a resource's subject association,
      #   carrying both Cadenya's canonical id and the customer's own key.
      #
      #   @param id [String] Cadenya's canonical subject id.
      #
      #   @param external_id [String] The subject identifier in the customer's namespace, as asserted. Unique
      #
      #   @param name [String] Human-readable name of the subject, when one has been asserted.
    end
  end
end
