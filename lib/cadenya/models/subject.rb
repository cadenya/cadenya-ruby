# frozen_string_literal: true

module Cadenya
  module Models
    class Subject < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata]
      required :metadata, -> { Cadenya::ResourceMetadata }

      # @!attribute info
      #   SubjectInfo provides read-only server-derived data about a subject.
      #
      #   @return [Cadenya::Models::SubjectInfo, nil]
      optional :info, -> { Cadenya::SubjectInfo }

      # @!method initialize(metadata:, info: nil)
      #   Some parameter documentations has been truncated, see {Cadenya::Models::Subject}
      #   for more details.
      #
      #   Subject is a person within a tenant as a readable record. Like Tenant it carries
      #   no spec — `metadata.external_id` is the customer's key for them, unique within
      #   the tenant rather than the workspace.
      #
      #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param info [Cadenya::Models::SubjectInfo] SubjectInfo provides read-only server-derived data about a subject.
    end
  end
end
