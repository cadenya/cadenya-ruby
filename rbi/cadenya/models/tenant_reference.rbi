# typed: strong

module Cadenya
  module Models
    class TenantReference < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::TenantReference, Cadenya::Internal::AnyHash)
        end

      # Cadenya's canonical tenant id.
      sig { returns(String) }
      attr_accessor :id

      # The tenant identifier in the customer's namespace, as asserted.
      sig { returns(String) }
      attr_accessor :external_id

      # Human-readable name of the tenant, when one has been asserted.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # TenantReference is the read-only echo of a resource's tenant association,
      # carrying both Cadenya's canonical id and the customer's own key.
      sig do
        params(id: String, external_id: String, name: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # Cadenya's canonical tenant id.
        id:,
        # The tenant identifier in the customer's namespace, as asserted.
        external_id:,
        # Human-readable name of the tenant, when one has been asserted.
        name: nil
      )
      end

      sig do
        override.returns({ id: String, external_id: String, name: String })
      end
      def to_hash
      end
    end
  end
end
