# typed: strong

module Cadenya
  module Models
    class SubjectInfo < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::SubjectInfo, Cadenya::Internal::AnyHash) }

      # Number of objectives associated with this subject.
      sig { returns(Integer) }
      attr_accessor :objective_count

      # TenantReference is the read-only echo of a resource's tenant association,
      # carrying both Cadenya's canonical id and the customer's own key.
      sig { returns(Cadenya::TenantReference) }
      attr_accessor :tenant

      # SubjectInfo provides read-only server-derived data about a subject.
      sig do
        params(
          objective_count: Integer,
          tenant: Cadenya::TenantReference::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Number of objectives associated with this subject.
        objective_count:,
        # TenantReference is the read-only echo of a resource's tenant association,
        # carrying both Cadenya's canonical id and the customer's own key.
        tenant:
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
