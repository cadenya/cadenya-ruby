# typed: strong

module Cadenya
  module Models
    class ObjectiveContextWindow < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveContextWindow, Cadenya::Internal::AnyHash)
        end

      sig { returns(Cadenya::ObjectiveContextWindowData) }
      attr_reader :data

      sig { params(data: Cadenya::ObjectiveContextWindowData::OrHash).void }
      attr_writer :data

      # Metadata for ephemeral operations and activities (e.g., objectives, executions,
      # runs)
      sig { returns(Cadenya::OperationMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::OperationMetadata::OrHash).void }
      attr_writer :metadata

      sig { returns(T.nilable(Cadenya::ObjectiveContextWindow::Info)) }
      attr_reader :info

      sig { params(info: Cadenya::ObjectiveContextWindow::Info::OrHash).void }
      attr_writer :info

      # ObjectiveContextWindow is a window of chat completions that is grouped together
      # to prevent context-window overflows. Context windows also allow agents to
      # compact their windows and carry on into a new one.
      sig do
        params(
          data: Cadenya::ObjectiveContextWindowData::OrHash,
          metadata: Cadenya::OperationMetadata::OrHash,
          info: Cadenya::ObjectiveContextWindow::Info::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        data:,
        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        metadata:,
        info: nil
      )
      end

      sig do
        override.returns(
          {
            data: Cadenya::ObjectiveContextWindowData,
            metadata: Cadenya::OperationMetadata,
            info: Cadenya::ObjectiveContextWindow::Info
          }
        )
      end
      def to_hash
      end

      class Info < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ObjectiveContextWindow::Info,
              Cadenya::Internal::AnyHash
            )
          end

        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        sig { returns(T.nilable(Cadenya::Profile)) }
        attr_reader :created_by

        sig { params(created_by: Cadenya::Profile::OrHash).void }
        attr_writer :created_by

        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        sig { returns(T.nilable(Cadenya::OperationMetadata)) }
        attr_reader :objective

        sig { params(objective: Cadenya::OperationMetadata::OrHash).void }
        attr_writer :objective

        sig do
          params(
            created_by: Cadenya::Profile::OrHash,
            objective: Cadenya::OperationMetadata::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # A profile identifies a user or non-human principal (such as an API key) at the
          # account level. Profiles are account-scoped and can be granted access to multiple
          # workspaces.
          created_by: nil,
          # Metadata for ephemeral operations and activities (e.g., objectives, executions,
          # runs)
          objective: nil
        )
        end

        sig do
          override.returns(
            {
              created_by: Cadenya::Profile,
              objective: Cadenya::OperationMetadata
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
