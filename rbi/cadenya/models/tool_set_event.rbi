# typed: strong

module Cadenya
  module Models
    class ToolSetEvent < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetEvent, Cadenya::Internal::AnyHash)
        end

      # Metadata for ephemeral operations and activities (e.g., objectives, executions,
      # runs)
      sig { returns(Cadenya::OperationMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::OperationMetadata::OrHash).void }
      attr_writer :metadata

      # Event payload for a tool set operation.
      sig { returns(T.nilable(Cadenya::ToolSetEventData::Variants)) }
      attr_reader :event

      sig do
        params(
          event:
            T.any(
              Cadenya::ToolSetEventDataSyncStarted::OrHash,
              Cadenya::ToolSetEventDataSyncCompleted::OrHash,
              Cadenya::ToolSetEventDataSyncFailed::OrHash
            )
        ).void
      end
      attr_writer :event

      sig { returns(T.nilable(Cadenya::ToolSetEvent::Info)) }
      attr_reader :info

      sig { params(info: Cadenya::ToolSetEvent::Info::OrHash).void }
      attr_writer :info

      # The tool set this event is associated with.
      sig { returns(T.nilable(String)) }
      attr_reader :tool_set_id

      sig { params(tool_set_id: String).void }
      attr_writer :tool_set_id

      # A single event in the tool set's operation timeline.
      sig do
        params(
          metadata: Cadenya::OperationMetadata::OrHash,
          event:
            T.any(
              Cadenya::ToolSetEventDataSyncStarted::OrHash,
              Cadenya::ToolSetEventDataSyncCompleted::OrHash,
              Cadenya::ToolSetEventDataSyncFailed::OrHash
            ),
          info: Cadenya::ToolSetEvent::Info::OrHash,
          tool_set_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        metadata:,
        # Event payload for a tool set operation.
        event: nil,
        info: nil,
        # The tool set this event is associated with.
        tool_set_id: nil
      )
      end

      sig do
        override.returns(
          {
            metadata: Cadenya::OperationMetadata,
            event: Cadenya::ToolSetEventData::Variants,
            info: Cadenya::ToolSetEvent::Info,
            tool_set_id: String
          }
        )
      end
      def to_hash
      end

      class Info < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::ToolSetEvent::Info, Cadenya::Internal::AnyHash)
          end

        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        sig { returns(T.nilable(Cadenya::Profile)) }
        attr_reader :created_by

        sig { params(created_by: Cadenya::Profile::OrHash).void }
        attr_writer :created_by

        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        sig { returns(T.nilable(Cadenya::ResourceMetadata)) }
        attr_reader :tool_set

        sig { params(tool_set: Cadenya::ResourceMetadata::OrHash).void }
        attr_writer :tool_set

        sig do
          params(
            created_by: Cadenya::Profile::OrHash,
            tool_set: Cadenya::ResourceMetadata::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # A profile identifies a user or non-human principal (such as an API key) at the
          # account level. Profiles are account-scoped and can be granted access to multiple
          # workspaces.
          created_by: nil,
          # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
          tool_set: nil
        )
        end

        sig do
          override.returns(
            {
              created_by: Cadenya::Profile,
              tool_set: Cadenya::ResourceMetadata
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
