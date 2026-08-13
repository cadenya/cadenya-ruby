# typed: strong

module Cadenya
  module Models
    class WidgetSessionDeleteTenantResponse < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::Models::WidgetSessionDeleteTenantResponse,
            Cadenya::Internal::AnyHash
          )
        end

      # Number of conversations (objectives) deleted along with the sessions.
      sig { returns(Integer) }
      attr_accessor :objectives_deleted

      # Number of sessions deleted.
      sig { returns(Integer) }
      attr_accessor :sessions_deleted

      # Delete tenant widget sessions response.
      sig do
        params(objectives_deleted: Integer, sessions_deleted: Integer).returns(
          T.attached_class
        )
      end
      def self.new(
        # Number of conversations (objectives) deleted along with the sessions.
        objectives_deleted:,
        # Number of sessions deleted.
        sessions_deleted:
      )
      end

      sig do
        override.returns(
          { objectives_deleted: Integer, sessions_deleted: Integer }
        )
      end
      def to_hash
      end
    end
  end
end
