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
      sig { returns(T.nilable(Integer)) }
      attr_reader :objectives_deleted

      sig { params(objectives_deleted: Integer).void }
      attr_writer :objectives_deleted

      # Number of sessions deleted.
      sig { returns(T.nilable(Integer)) }
      attr_reader :sessions_deleted

      sig { params(sessions_deleted: Integer).void }
      attr_writer :sessions_deleted

      # Delete tenant widget sessions response.
      sig do
        params(objectives_deleted: Integer, sessions_deleted: Integer).returns(
          T.attached_class
        )
      end
      def self.new(
        # Number of conversations (objectives) deleted along with the sessions.
        objectives_deleted: nil,
        # Number of sessions deleted.
        sessions_deleted: nil
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
