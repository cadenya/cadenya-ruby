# typed: strong

module Cadenya
  module Models
    class SubjectAssertion < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::SubjectAssertion, Cadenya::Internal::AnyHash)
        end

      # The subject identifier in the customer's namespace (e.g. their user id). Stored
      # as the subject record's external_id; unique within the tenant.
      sig { returns(String) }
      attr_accessor :id

      # Optional human-readable name for the subject. Updates the subject record's name
      # on every assertion that provides it.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # SubjectAssertion identifies a person within a tenant in the customer's own
      # namespace — typically their user id. Asserting a subject upserts the subject
      # record under the asserted tenant and associates the created resource with it. A
      # subject assertion is only valid alongside a tenant assertion: subject
      # identifiers are scoped to their tenant.
      sig { params(id: String, name: String).returns(T.attached_class) }
      def self.new(
        # The subject identifier in the customer's namespace (e.g. their user id). Stored
        # as the subject record's external_id; unique within the tenant.
        id:,
        # Optional human-readable name for the subject. Updates the subject record's name
        # on every assertion that provides it.
        name: nil
      )
      end

      sig { override.returns({ id: String, name: String }) }
      def to_hash
      end
    end
  end
end
