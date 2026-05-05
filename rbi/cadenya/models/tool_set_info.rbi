# typed: strong

module Cadenya
  module Models
    class ToolSetInfo < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::ToolSetInfo, Cadenya::Internal::AnyHash) }

      # A profile identifies a user or non-human principal (such as an API key) at the
      # account level. Profiles are account-scoped and can be granted access to multiple
      # workspaces.
      sig { returns(T.nilable(Cadenya::Profile)) }
      attr_reader :created_by

      sig { params(created_by: Cadenya::Profile::OrHash).void }
      attr_writer :created_by

      sig { returns(T.nilable(Integer)) }
      attr_reader :agent_count

      sig { params(agent_count: Integer).void }
      attr_writer :agent_count

      sig { returns(T.nilable(Time)) }
      attr_reader :last_sync

      sig { params(last_sync: Time).void }
      attr_writer :last_sync

      sig { returns(T.nilable(Integer)) }
      attr_reader :tool_count

      sig { params(tool_count: Integer).void }
      attr_writer :tool_count

      sig do
        params(
          agent_count: Integer,
          created_by: Cadenya::Profile::OrHash,
          last_sync: Time,
          tool_count: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        agent_count: nil,
        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        created_by: nil,
        last_sync: nil,
        tool_count: nil
      )
      end

      sig do
        override.returns(
          {
            agent_count: Integer,
            created_by: Cadenya::Profile,
            last_sync: Time,
            tool_count: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
