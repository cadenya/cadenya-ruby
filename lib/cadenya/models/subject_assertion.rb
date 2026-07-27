# frozen_string_literal: true

module Cadenya
  module Models
    class SubjectAssertion < Cadenya::Internal::Type::BaseModel
      # @!attribute id
      #   The subject identifier in the customer's namespace (e.g. their user id). Stored
      #   as the subject record's external_id; unique within the tenant.
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Optional human-readable name for the subject. Updates the subject record's name
      #   on every assertion that provides it.
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(id:, name: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::SubjectAssertion} for more details.
      #
      #   SubjectAssertion identifies a person within a tenant in the customer's own
      #   namespace — typically their user id. Asserting a subject upserts the subject
      #   record under the asserted tenant and associates the created resource with it. A
      #   subject assertion is only valid alongside a tenant assertion: subject
      #   identifiers are scoped to their tenant.
      #
      #   @param id [String] The subject identifier in the customer's namespace (e.g. their user id).
      #
      #   @param name [String] Optional human-readable name for the subject. Updates the subject
    end
  end
end
