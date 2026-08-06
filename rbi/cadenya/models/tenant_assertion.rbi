# typed: strong

module Cadenya
  module Models
    class TenantAssertion < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::TenantAssertion, Cadenya::Internal::AnyHash)
        end

      # The tenant identifier in the customer's namespace (e.g. "acme-corp"). Stored as
      # the tenant record's external_id; stable across requests.
      sig { returns(String) }
      attr_accessor :id

      # Optional human-readable name for the tenant. Updates the tenant record's name on
      # every assertion that provides it.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # TenantAssertion identifies a tenant in the customer's own namespace — their org,
      # company, or team identifier for an end user. Asserting a tenant upserts the
      # tenant record in the workspace (keyed on `id` as the tenant's external_id) and
      # associates the created resource with it.
      sig { params(id: String, name: String).returns(T.attached_class) }
      def self.new(
        # The tenant identifier in the customer's namespace (e.g. "acme-corp"). Stored as
        # the tenant record's external_id; stable across requests.
        id:,
        # Optional human-readable name for the tenant. Updates the tenant record's name on
        # every assertion that provides it.
        name: nil
      )
      end

      sig { override.returns({ id: String, name: String }) }
      def to_hash
      end
    end
  end
end
