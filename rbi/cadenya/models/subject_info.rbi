# typed: strong

module Cadenya
  module Models
    class SubjectInfo < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::SubjectInfo, Cadenya::Internal::AnyHash) }

      # Number of objectives associated with this subject.
      sig { returns(T.nilable(Integer)) }
      attr_reader :objective_count

      sig { params(objective_count: Integer).void }
      attr_writer :objective_count

      # TenantReference is the read-only echo of a resource's tenant association,
      # carrying both Cadenya's canonical id and the customer's own key.
      sig { returns(T.nilable(Cadenya::TenantReference)) }
      attr_reader :tenant

      sig { params(tenant: Cadenya::TenantReference::OrHash).void }
      attr_writer :tenant

      # SubjectInfo provides read-only server-derived data about a subject.
      sig do
        params(
          objective_count: Integer,
          tenant: Cadenya::TenantReference::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Number of objectives associated with this subject.
        objective_count: nil,
        # TenantReference is the read-only echo of a resource's tenant association,
        # carrying both Cadenya's canonical id and the customer's own key.
        tenant: nil
      )
      end

      sig do
        override.returns(
          { objective_count: Integer, tenant: Cadenya::TenantReference }
        )
      end
      def to_hash
      end
    end
  end
end
