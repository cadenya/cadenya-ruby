# typed: strong

module Cadenya
  module Models
    class MemoryLayerInfo < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::MemoryLayerInfo, Cadenya::Internal::AnyHash)
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
      attr_reader :agent

      sig { params(agent: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :agent

      # Number of entries currently in this layer.
      sig { returns(Integer) }
      attr_accessor :entry_count

      # Timestamp of the most recent objective that resolved against this layer. Useful
      # for surfacing unused layers in the dashboard.
      sig { returns(T.nilable(Time)) }
      attr_reader :last_used_at

      sig { params(last_used_at: Time).void }
      attr_writer :last_used_at

      sig do
        params(
          entry_count: Integer,
          agent: Cadenya::ResourceMetadata::OrHash,
          created_by: Cadenya::Profile::OrHash,
          last_used_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # Number of entries currently in this layer.
        entry_count:,
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        agent: nil,
        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        created_by: nil,
        # Timestamp of the most recent objective that resolved against this layer. Useful
        # for surfacing unused layers in the dashboard.
        last_used_at: nil
      )
      end

      sig do
        override.returns(
          {
            agent: Cadenya::ResourceMetadata,
            created_by: Cadenya::Profile,
            entry_count: Integer,
            last_used_at: Time
          }
        )
      end
      def to_hash
      end
    end
  end
end
