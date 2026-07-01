# typed: strong

module Cadenya
  module Models
    class ObjectiveEvent < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveEvent, Cadenya::Internal::AnyHash)
        end

      sig { returns(Cadenya::ObjectiveEventData) }
      attr_reader :data

      sig { params(data: Cadenya::ObjectiveEventData::OrHash).void }
      attr_writer :data

      # Metadata for ephemeral operations and activities (e.g., objectives, executions,
      # runs)
      sig { returns(Cadenya::OperationMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::OperationMetadata::OrHash).void }
      attr_writer :metadata

      sig { returns(T.nilable(String)) }
      attr_reader :context_window_id

      sig { params(context_window_id: String).void }
      attr_writer :context_window_id

      sig { returns(T.nilable(Cadenya::ObjectiveEventInfo)) }
      attr_reader :info

      sig { params(info: Cadenya::ObjectiveEventInfo::OrHash).void }
      attr_writer :info

      sig do
        params(
          data: Cadenya::ObjectiveEventData::OrHash,
          metadata: Cadenya::OperationMetadata::OrHash,
          context_window_id: String,
          info: Cadenya::ObjectiveEventInfo::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        data:,
        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        metadata:,
        context_window_id: nil,
        info: nil
      )
      end

      sig do
        override.returns(
          {
            data: Cadenya::ObjectiveEventData,
            metadata: Cadenya::OperationMetadata,
            context_window_id: String,
            info: Cadenya::ObjectiveEventInfo
          }
        )
      end
      def to_hash
      end
    end
  end
end
