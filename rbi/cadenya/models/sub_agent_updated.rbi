# typed: strong

module Cadenya
  module Models
    class SubAgentUpdated < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::SubAgentUpdated, Cadenya::Internal::AnyHash)
        end

      # BareMetadata contains the minimal metadata for a resource: the ID and an
      # optional human-readable name. These are used for reference fields where the full
      # metadata (account scoping, timestamps, labels, external IDs) is not needed —
      # e.g., the tool references inside an agent variation spec or the tools assigned
      # to an objective. Both fields are server-populated; clients provide IDs through
      # sibling fields rather than by constructing a BareMetadata themselves.
      sig { returns(T.nilable(Cadenya::BareMetadata)) }
      attr_reader :agent

      sig { params(agent: Cadenya::BareMetadata::OrHash).void }
      attr_writer :agent

      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      # BareMetadata contains the minimal metadata for a resource: the ID and an
      # optional human-readable name. These are used for reference fields where the full
      # metadata (account scoping, timestamps, labels, external IDs) is not needed —
      # e.g., the tool references inside an agent variation spec or the tools assigned
      # to an objective. Both fields are server-populated; clients provide IDs through
      # sibling fields rather than by constructing a BareMetadata themselves.
      sig { returns(T.nilable(Cadenya::BareMetadata)) }
      attr_reader :objective

      sig { params(objective: Cadenya::BareMetadata::OrHash).void }
      attr_writer :objective

      sig { returns(T.nilable(Cadenya::SubAgentUpdated::Status::TaggedSymbol)) }
      attr_reader :status

      sig { params(status: Cadenya::SubAgentUpdated::Status::OrSymbol).void }
      attr_writer :status

      sig do
        params(
          agent: Cadenya::BareMetadata::OrHash,
          message: String,
          objective: Cadenya::BareMetadata::OrHash,
          status: Cadenya::SubAgentUpdated::Status::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # BareMetadata contains the minimal metadata for a resource: the ID and an
        # optional human-readable name. These are used for reference fields where the full
        # metadata (account scoping, timestamps, labels, external IDs) is not needed —
        # e.g., the tool references inside an agent variation spec or the tools assigned
        # to an objective. Both fields are server-populated; clients provide IDs through
        # sibling fields rather than by constructing a BareMetadata themselves.
        agent: nil,
        message: nil,
        # BareMetadata contains the minimal metadata for a resource: the ID and an
        # optional human-readable name. These are used for reference fields where the full
        # metadata (account scoping, timestamps, labels, external IDs) is not needed —
        # e.g., the tool references inside an agent variation spec or the tools assigned
        # to an objective. Both fields are server-populated; clients provide IDs through
        # sibling fields rather than by constructing a BareMetadata themselves.
        objective: nil,
        status: nil
      )
      end

      sig do
        override.returns(
          {
            agent: Cadenya::BareMetadata,
            message: String,
            objective: Cadenya::BareMetadata,
            status: Cadenya::SubAgentUpdated::Status::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Status
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::SubAgentUpdated::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATUS_UNSPECIFIED =
          T.let(
            :STATUS_UNSPECIFIED,
            Cadenya::SubAgentUpdated::Status::TaggedSymbol
          )
        STATUS_PENDING =
          T.let(:STATUS_PENDING, Cadenya::SubAgentUpdated::Status::TaggedSymbol)
        STATUS_RUNNING =
          T.let(:STATUS_RUNNING, Cadenya::SubAgentUpdated::Status::TaggedSymbol)
        STATUS_COMPLETED =
          T.let(
            :STATUS_COMPLETED,
            Cadenya::SubAgentUpdated::Status::TaggedSymbol
          )
        STATUS_FAILED =
          T.let(:STATUS_FAILED, Cadenya::SubAgentUpdated::Status::TaggedSymbol)
        STATUS_CANCELLED =
          T.let(
            :STATUS_CANCELLED,
            Cadenya::SubAgentUpdated::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::SubAgentUpdated::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
