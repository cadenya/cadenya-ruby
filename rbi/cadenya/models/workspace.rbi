# typed: strong

module Cadenya
  module Models
    class Workspace < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::Workspace, Cadenya::Internal::AnyHash) }

      # AccountResourceMetadata is used to represent a resource that is associated to an
      # account but not to a workspace.
      sig { returns(Cadenya::AccountResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::AccountResourceMetadata::OrHash).void }
      attr_writer :metadata

      sig { returns(Cadenya::WorkspaceSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::WorkspaceSpec::OrHash).void }
      attr_writer :spec

      # WorkspaceInfo returns counts
      sig { returns(T.nilable(Cadenya::Workspace::Info)) }
      attr_reader :info

      sig { params(info: Cadenya::Workspace::Info::OrHash).void }
      attr_writer :info

      # Lifecycle status of the workspace. Archived workspaces reject all requests
      # scoped to them. Server-populated.
      sig { returns(Cadenya::Workspace::Status::TaggedSymbol) }
      attr_accessor :status

      sig do
        params(
          metadata: Cadenya::AccountResourceMetadata::OrHash,
          spec: Cadenya::WorkspaceSpec::OrHash,
          status: Cadenya::Workspace::Status::OrSymbol,
          info: Cadenya::Workspace::Info::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # AccountResourceMetadata is used to represent a resource that is associated to an
        # account but not to a workspace.
        metadata:,
        spec:,
        # Lifecycle status of the workspace. Archived workspaces reject all requests
        # scoped to them. Server-populated.
        status:,
        # WorkspaceInfo returns counts
        info: nil
      )
      end

      sig do
        override.returns(
          {
            metadata: Cadenya::AccountResourceMetadata,
            spec: Cadenya::WorkspaceSpec,
            info: Cadenya::Workspace::Info,
            status: Cadenya::Workspace::Status::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Info < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::Workspace::Info, Cadenya::Internal::AnyHash)
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :total_agents

        sig { params(total_agents: Integer).void }
        attr_writer :total_agents

        sig { returns(T.nilable(Integer)) }
        attr_reader :total_agent_variations

        sig { params(total_agent_variations: Integer).void }
        attr_writer :total_agent_variations

        sig { returns(T.nilable(Integer)) }
        attr_reader :total_available_tools

        sig { params(total_available_tools: Integer).void }
        attr_writer :total_available_tools

        sig { returns(T.nilable(Integer)) }
        attr_reader :total_memory_entries

        sig { params(total_memory_entries: Integer).void }
        attr_writer :total_memory_entries

        # WorkspaceInfo returns counts
        sig do
          params(
            total_agents: Integer,
            total_agent_variations: Integer,
            total_available_tools: Integer,
            total_memory_entries: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          total_agents: nil,
          total_agent_variations: nil,
          total_available_tools: nil,
          total_memory_entries: nil
        )
        end

        sig do
          override.returns(
            {
              total_agents: Integer,
              total_agent_variations: Integer,
              total_available_tools: Integer,
              total_memory_entries: Integer
            }
          )
        end
        def to_hash
        end
      end

      # Lifecycle status of the workspace. Archived workspaces reject all requests
      # scoped to them. Server-populated.
      module Status
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::Workspace::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATUS_ENABLED =
          T.let(:STATUS_ENABLED, Cadenya::Workspace::Status::TaggedSymbol)
        STATUS_DISABLED =
          T.let(:STATUS_DISABLED, Cadenya::Workspace::Status::TaggedSymbol)
        STATUS_ARCHIVED =
          T.let(:STATUS_ARCHIVED, Cadenya::Workspace::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Cadenya::Workspace::Status::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
