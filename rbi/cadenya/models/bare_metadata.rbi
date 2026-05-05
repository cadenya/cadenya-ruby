# typed: strong

module Cadenya
  module Models
    class BareMetadata < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::BareMetadata, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Human-readable name of the referenced resource, populated by the server on reads
      # for convenience. Absent on references to resources that do not have a name
      # (e.g., objective tasks).
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # BareMetadata contains the minimal metadata for a resource: the ID and an
      # optional human-readable name. These are used for reference fields where the full
      # metadata (account scoping, timestamps, labels, external IDs) is not needed —
      # e.g., the tool references inside an agent variation spec or the tools assigned
      # to an objective. Both fields are server-populated; clients provide IDs through
      # sibling fields rather than by constructing a BareMetadata themselves.
      sig { params(id: String, name: String).returns(T.attached_class) }
      def self.new(
        id: nil,
        # Human-readable name of the referenced resource, populated by the server on reads
        # for convenience. Absent on references to resources that do not have a name
        # (e.g., objective tasks).
        name: nil
      )
      end

      sig { override.returns({ id: String, name: String }) }
      def to_hash
      end
    end
  end
end
