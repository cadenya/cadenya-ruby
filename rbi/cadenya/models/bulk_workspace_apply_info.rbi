# typed: strong

module Cadenya
  module Models
    class BulkWorkspaceApplyInfo < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::BulkWorkspaceApplyInfo, Cadenya::Internal::AnyHash)
        end

      # A profile identifies a user or non-human principal (such as an API key) at the
      # account level. Profiles are account-scoped and can be granted access to multiple
      # workspaces.
      sig { returns(T.nilable(Cadenya::Profile)) }
      attr_reader :created_by

      sig { params(created_by: Cadenya::Profile::OrHash).void }
      attr_writer :created_by

      sig { returns(T.nilable(Time)) }
      attr_reader :completed_at

      sig { params(completed_at: Time).void }
      attr_writer :completed_at

      sig { returns(T.nilable(Integer)) }
      attr_reader :created_count

      sig { params(created_count: Integer).void }
      attr_writer :created_count

      sig { returns(T.nilable(Integer)) }
      attr_reader :deleted_count

      sig { params(deleted_count: Integer).void }
      attr_writer :deleted_count

      sig { returns(T.nilable(Integer)) }
      attr_reader :failed_count

      sig { params(failed_count: Integer).void }
      attr_writer :failed_count

      sig { returns(T.nilable(Time)) }
      attr_reader :started_at

      sig { params(started_at: Time).void }
      attr_writer :started_at

      sig { returns(T.nilable(Integer)) }
      attr_reader :total_count

      sig { params(total_count: Integer).void }
      attr_writer :total_count

      sig { returns(T.nilable(Integer)) }
      attr_reader :unchanged_count

      sig { params(unchanged_count: Integer).void }
      attr_writer :unchanged_count

      sig { returns(T.nilable(Integer)) }
      attr_reader :updated_count

      sig { params(updated_count: Integer).void }
      attr_writer :updated_count

      sig do
        params(
          completed_at: Time,
          created_by: Cadenya::Profile::OrHash,
          created_count: Integer,
          deleted_count: Integer,
          failed_count: Integer,
          started_at: Time,
          total_count: Integer,
          unchanged_count: Integer,
          updated_count: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        completed_at: nil,
        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        created_by: nil,
        created_count: nil,
        deleted_count: nil,
        failed_count: nil,
        started_at: nil,
        total_count: nil,
        unchanged_count: nil,
        updated_count: nil
      )
      end

      sig do
        override.returns(
          {
            completed_at: Time,
            created_by: Cadenya::Profile,
            created_count: Integer,
            deleted_count: Integer,
            failed_count: Integer,
            started_at: Time,
            total_count: Integer,
            unchanged_count: Integer,
            updated_count: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
