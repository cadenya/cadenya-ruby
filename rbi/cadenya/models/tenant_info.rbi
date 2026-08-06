# typed: strong

module Cadenya
  module Models
    class TenantInfo < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::TenantInfo, Cadenya::Internal::AnyHash) }

      # Number of objectives associated with this tenant, across every surface — widget
      # conversations and objectives created directly against the API alike. This is the
      # footprint a delete would destroy, which is why it is worth the count query that
      # populating `info` costs.
      sig { returns(T.nilable(Integer)) }
      attr_reader :objective_count

      sig { params(objective_count: Integer).void }
      attr_writer :objective_count

      # Number of subjects asserted under this tenant.
      sig { returns(T.nilable(Integer)) }
      attr_reader :subject_count

      sig { params(subject_count: Integer).void }
      attr_writer :subject_count

      # Number of widget sessions minted for this tenant that still exist.
      sig { returns(T.nilable(Integer)) }
      attr_reader :widget_session_count

      sig { params(widget_session_count: Integer).void }
      attr_writer :widget_session_count

      # TenantInfo provides read-only server-derived data about a tenant.
      sig do
        params(
          objective_count: Integer,
          subject_count: Integer,
          widget_session_count: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Number of objectives associated with this tenant, across every surface — widget
        # conversations and objectives created directly against the API alike. This is the
        # footprint a delete would destroy, which is why it is worth the count query that
        # populating `info` costs.
        objective_count: nil,
        # Number of subjects asserted under this tenant.
        subject_count: nil,
        # Number of widget sessions minted for this tenant that still exist.
        widget_session_count: nil
      )
      end

      sig do
        override.returns(
          {
            objective_count: Integer,
            subject_count: Integer,
            widget_session_count: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
