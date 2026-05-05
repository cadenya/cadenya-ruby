# typed: strong

module Cadenya
  module Models
    class ToolApproved < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolApproved, Cadenya::Internal::AnyHash)
        end

      # The ID of the objective tool call record that was approved via the
      # ApproveToolCall RPC.
      sig { returns(T.nilable(String)) }
      attr_reader :tool_call_id

      sig { params(tool_call_id: String).void }
      attr_writer :tool_call_id

      sig { params(tool_call_id: String).returns(T.attached_class) }
      def self.new(
        # The ID of the objective tool call record that was approved via the
        # ApproveToolCall RPC.
        tool_call_id: nil
      )
      end

      sig { override.returns({ tool_call_id: String }) }
      def to_hash
      end
    end
  end
end
