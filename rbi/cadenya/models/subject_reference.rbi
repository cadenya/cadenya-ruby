# typed: strong

module Cadenya
  module Models
    class SubjectReference < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::SubjectReference, Cadenya::Internal::AnyHash)
        end

      # Cadenya's canonical subject id.
      sig { returns(String) }
      attr_accessor :id

      # The subject identifier in the customer's namespace, as asserted. Unique within
      # the subject's tenant.
      sig { returns(String) }
      attr_accessor :external_id

      # Human-readable name of the subject, when one has been asserted.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # SubjectReference is the read-only echo of a resource's subject association,
      # carrying both Cadenya's canonical id and the customer's own key.
      sig do
        params(id: String, external_id: String, name: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # Cadenya's canonical subject id.
        id:,
        # The subject identifier in the customer's namespace, as asserted. Unique within
        # the subject's tenant.
        external_id:,
        # Human-readable name of the subject, when one has been asserted.
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
