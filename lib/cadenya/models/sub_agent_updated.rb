# frozen_string_literal: true

module Cadenya
  module Models
    class SubAgentUpdated < Cadenya::Internal::Type::BaseModel
      # @!attribute agent
      #   BareMetadata contains the minimal metadata for a resource: the ID and an
      #   optional human-readable name. These are used for reference fields where the full
      #   metadata (account scoping, timestamps, labels, external IDs) is not needed —
      #   e.g., the tool references inside an agent variation spec or the tools assigned
      #   to an objective. Both fields are server-populated; clients provide IDs through
      #   sibling fields rather than by constructing a BareMetadata themselves.
      #
      #   @return [Cadenya::Models::BareMetadata, nil]
      optional :agent, -> { Cadenya::BareMetadata }

      # @!attribute message
      #
      #   @return [String, nil]
      optional :message, String

      # @!attribute objective
      #   BareMetadata contains the minimal metadata for a resource: the ID and an
      #   optional human-readable name. These are used for reference fields where the full
      #   metadata (account scoping, timestamps, labels, external IDs) is not needed —
      #   e.g., the tool references inside an agent variation spec or the tools assigned
      #   to an objective. Both fields are server-populated; clients provide IDs through
      #   sibling fields rather than by constructing a BareMetadata themselves.
      #
      #   @return [Cadenya::Models::BareMetadata, nil]
      optional :objective, -> { Cadenya::BareMetadata }

      # @!attribute status
      #
      #   @return [Symbol, Cadenya::Models::SubAgentUpdated::Status, nil]
      optional :status, enum: -> { Cadenya::SubAgentUpdated::Status }

      # @!method initialize(agent: nil, message: nil, objective: nil, status: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::SubAgentUpdated} for more details.
      #
      #   @param agent [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
      #
      #   @param message [String]
      #
      #   @param objective [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
      #
      #   @param status [Symbol, Cadenya::Models::SubAgentUpdated::Status]

      # @see Cadenya::Models::SubAgentUpdated#status
      module Status
        extend Cadenya::Internal::Type::Enum

        STATUS_UNSPECIFIED = :STATUS_UNSPECIFIED
        STATUS_PENDING = :STATUS_PENDING
        STATUS_RUNNING = :STATUS_RUNNING
        STATUS_COMPLETED = :STATUS_COMPLETED
        STATUS_FAILED = :STATUS_FAILED
        STATUS_CANCELLED = :STATUS_CANCELLED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
