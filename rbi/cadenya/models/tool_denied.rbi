# typed: strong

module Cadenya
  module Models
    class ToolDenied < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::ToolDenied, Cadenya::Internal::AnyHash) }

      # The memo provided by the reviewer when denying the tool call. This is passed to
      # the agent to provide further instructions.
      sig { returns(T.nilable(String)) }
      attr_reader :memo

      sig { params(memo: String).void }
      attr_writer :memo

      # The ID of the objective tool call record that was denied via the DenyToolCall
      # RPC.
      sig { returns(T.nilable(String)) }
      attr_reader :tool_call_id

      sig { params(tool_call_id: String).void }
      attr_writer :tool_call_id

      sig do
        params(memo: String, tool_call_id: String).returns(T.attached_class)
      end
      def self.new(
        # The memo provided by the reviewer when denying the tool call. This is passed to
        # the agent to provide further instructions.
        memo: nil,
        # The ID of the objective tool call record that was denied via the DenyToolCall
        # RPC.
        tool_call_id: nil
      )
      end

      sig { override.returns({ memo: String, tool_call_id: String }) }
      def to_hash
      end
    end
  end
end
