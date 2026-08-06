# typed: strong

module Cadenya
  module Models
    ObjectiveToolCallData = Objectives::ObjectiveToolCallData

    module Objectives
      class ObjectiveToolCallData < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveToolCallData,
              Cadenya::Internal::AnyHash
            )
          end

        # CallableTool is a union that represents a tool that can be called by an agent.
        # In Cadenya, a tool that is used within an agent objective might be a
        # user-defined tool (IE: MCP, HTTP), another Agent (useful to separate context),
        # or a Cadenya Tool (one Cadenya provides).
        sig { returns(Cadenya::CallableTool) }
        attr_reader :callable

        sig { params(callable: Cadenya::CallableTool::OrHash).void }
        attr_writer :callable

        # The arguments passed to the tool
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :arguments

        sig { params(arguments: T::Hash[Symbol, T.anything]).void }
        attr_writer :arguments

        # A memo supplied by the reviewer when denying the tool call
        sig { returns(T.nilable(String)) }
        attr_reader :memo

        sig { params(memo: String).void }
        attr_writer :memo

        # List of resolved secrets used by the tool call
        sig do
          returns(T.nilable(T::Array[Cadenya::Objectives::ResolvedSecret]))
        end
        attr_reader :resolved_secrets

        sig do
          params(
            resolved_secrets:
              T::Array[Cadenya::Objectives::ResolvedSecret::OrHash]
          ).void
        end
        attr_writer :resolved_secrets

        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        sig { returns(T.nilable(Cadenya::Profile)) }
        attr_reader :status_changed_by

        sig { params(status_changed_by: Cadenya::Profile::OrHash).void }
        attr_writer :status_changed_by

        sig do
          params(
            callable: Cadenya::CallableTool::OrHash,
            arguments: T::Hash[Symbol, T.anything],
            memo: String,
            resolved_secrets:
              T::Array[Cadenya::Objectives::ResolvedSecret::OrHash],
            status_changed_by: Cadenya::Profile::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # CallableTool is a union that represents a tool that can be called by an agent.
          # In Cadenya, a tool that is used within an agent objective might be a
          # user-defined tool (IE: MCP, HTTP), another Agent (useful to separate context),
          # or a Cadenya Tool (one Cadenya provides).
          callable:,
          # The arguments passed to the tool
          arguments: nil,
          # A memo supplied by the reviewer when denying the tool call
          memo: nil,
          # List of resolved secrets used by the tool call
          resolved_secrets: nil,
          # A profile identifies a user or non-human principal (such as an API key) at the
          # account level. Profiles are account-scoped and can be granted access to multiple
          # workspaces.
          status_changed_by: nil
        )
        end

        sig do
          override.returns(
            {
              callable: Cadenya::CallableTool,
              arguments: T::Hash[Symbol, T.anything],
              memo: String,
              resolved_secrets: T::Array[Cadenya::Objectives::ResolvedSecret],
              status_changed_by: Cadenya::Profile
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
