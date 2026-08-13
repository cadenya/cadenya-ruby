# typed: strong

module Cadenya
  module Models
    class ToolSetInfo < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::ToolSetInfo, Cadenya::Internal::AnyHash) }

      sig { returns(Integer) }
      attr_accessor :available_tools

      # A profile identifies a user or non-human principal (such as an API key) at the
      # account level. Profiles are account-scoped and can be granted access to multiple
      # workspaces.
      sig { returns(T.nilable(Cadenya::Profile)) }
      attr_reader :created_by

      sig { params(created_by: Cadenya::Profile::OrHash).void }
      attr_writer :created_by

      sig { returns(Integer) }
      attr_accessor :omitted_tools

      sig { returns(Integer) }
      attr_accessor :agent_count

      sig { returns(T.nilable(Time)) }
      attr_reader :last_sync

      sig { params(last_sync: Time).void }
      attr_writer :last_sync

      sig { returns(Integer) }
      attr_accessor :tool_count

      sig do
        params(
          agent_count: Integer,
          available_tools: Integer,
          omitted_tools: Integer,
          tool_count: Integer,
          created_by: Cadenya::Profile::OrHash,
          last_sync: Time
        ).returns(T.attached_class)
      end
      def self.new(
        agent_count:,
        available_tools:,
        omitted_tools:,
        tool_count:,
        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        created_by: nil,
        last_sync: nil
      )
      end

      sig do
        override.returns(
          {
            agent_count: Integer,
            available_tools: Integer,
            created_by: Cadenya::Profile,
            last_sync: Time,
            omitted_tools: Integer,
            tool_count: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
