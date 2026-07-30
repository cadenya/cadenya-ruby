# typed: strong

module Cadenya
  module Models
    class Subject < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::Subject, Cadenya::Internal::AnyHash) }

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :metadata

      # SubjectInfo provides read-only server-derived data about a subject.
      sig { returns(T.nilable(Cadenya::SubjectInfo)) }
      attr_reader :info

      sig { params(info: Cadenya::SubjectInfo::OrHash).void }
      attr_writer :info

      # Subject is a person within a tenant as a readable record. Like Tenant it carries
      # no spec — `metadata.external_id` is the customer's key for them, unique within
      # the tenant rather than the workspace.
      sig do
        params(
          metadata: Cadenya::ResourceMetadata::OrHash,
          info: Cadenya::SubjectInfo::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        metadata:,
        # SubjectInfo provides read-only server-derived data about a subject.
        info: nil
      )
      end

      sig do
        override.returns(
          { metadata: Cadenya::ResourceMetadata, info: Cadenya::SubjectInfo }
        )
      end
      def to_hash
      end
    end
  end
end
