# typed: strong

module Cadenya
  module Models
    class Objective < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::Objective, Cadenya::Internal::AnyHash) }

      sig { returns(Cadenya::ObjectiveData) }
      attr_reader :data

      sig { params(data: Cadenya::ObjectiveData::OrHash).void }
      attr_writer :data

      # Metadata for ephemeral operations and activities (e.g., objectives, executions,
      # runs)
      sig { returns(Cadenya::OperationMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::OperationMetadata::OrHash).void }
      attr_writer :metadata

      sig { returns(Cadenya::ObjectiveStatus) }
      attr_reader :status

      sig { params(status: Cadenya::ObjectiveStatus::OrHash).void }
      attr_writer :status

      # ObjectiveInfo provides read-only aggregated statistics about an objective's
      # execution
      sig { returns(T.nilable(Cadenya::ObjectiveInfo)) }
      attr_reader :info

      sig { params(info: Cadenya::ObjectiveInfo::OrHash).void }
      attr_writer :info

      # Read-only list of the last five windows of execution for this objective, ordered
      # by most recent first. Is only included in singular RPC calls (GetObjective, for
      # example).
      sig { returns(T.nilable(T::Array[Cadenya::ObjectiveContextWindow])) }
      attr_reader :last_five_windows

      sig do
        params(
          last_five_windows: T::Array[Cadenya::ObjectiveContextWindow::OrHash]
        ).void
      end
      attr_writer :last_five_windows

      sig do
        params(
          data: Cadenya::ObjectiveData::OrHash,
          metadata: Cadenya::OperationMetadata::OrHash,
          status: Cadenya::ObjectiveStatus::OrHash,
          info: Cadenya::ObjectiveInfo::OrHash,
          last_five_windows: T::Array[Cadenya::ObjectiveContextWindow::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        data:,
        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        metadata:,
        status:,
        # ObjectiveInfo provides read-only aggregated statistics about an objective's
        # execution
        info: nil,
        # Read-only list of the last five windows of execution for this objective, ordered
        # by most recent first. Is only included in singular RPC calls (GetObjective, for
        # example).
        last_five_windows: nil
      )
      end

      sig do
        override.returns(
          {
            data: Cadenya::ObjectiveData,
            metadata: Cadenya::OperationMetadata,
            status: Cadenya::ObjectiveStatus,
            info: Cadenya::ObjectiveInfo,
            last_five_windows: T::Array[Cadenya::ObjectiveContextWindow]
          }
        )
      end
      def to_hash
      end
    end
  end
end
