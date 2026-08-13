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
      sig { returns(Integer) }
      attr_accessor :objective_count

      # Number of subjects asserted under this tenant.
      sig { returns(Integer) }
      attr_accessor :subject_count

      # Number of widget sessions minted for this tenant that still exist.
      sig { returns(Integer) }
      attr_accessor :widget_session_count

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
        objective_count:,
        # Number of subjects asserted under this tenant.
        subject_count:,
        # Number of widget sessions minted for this tenant that still exist.
        widget_session_count:
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
