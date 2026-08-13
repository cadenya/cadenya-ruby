# frozen_string_literal: true

module Cadenya
  module Models
    class BareMetadata < Cadenya::Internal::Type::BaseModel
      response_only do
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute name
        #   Human-readable name of the referenced resource, populated by the server on reads
        #   for convenience. Absent on references to resources that do not have a name
        #   (e.g., objective tasks).
        #
        #   @return [String, nil]
        optional :name, String
      end

      # @!method initialize(id:, name: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::BareMetadata} for more details.
      #
      #   BareMetadata contains the minimal metadata for a resource: the ID and an
      #   optional human-readable name. These are used for reference fields where the full
      #   metadata (account scoping, timestamps, labels, external IDs) is not needed —
      #   e.g., the tool references inside an agent variation spec or the tools assigned
      #   to an objective. Both fields are server-populated; clients provide IDs through
      #   sibling fields rather than by constructing a BareMetadata themselves.
      #
      #   @param id [String]
      #
      #   @param name [String] Human-readable name of the referenced resource, populated by the server
    end
  end
end
