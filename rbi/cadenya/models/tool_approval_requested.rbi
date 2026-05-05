# typed: strong

module Cadenya
  module Models
    class ToolApprovalRequested < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolApprovalRequested, Cadenya::Internal::AnyHash)
        end

      # The ID of the objective tool call record. Use this ID with the ApproveToolCall
      # or DenyToolCall RPCs to approve or deny the tool call.
      sig { returns(T.nilable(String)) }
      attr_reader :tool_call_id

      sig { params(tool_call_id: String).void }
      attr_writer :tool_call_id

      sig { params(tool_call_id: String).returns(T.attached_class) }
      def self.new(
        # The ID of the objective tool call record. Use this ID with the ApproveToolCall
        # or DenyToolCall RPCs to approve or deny the tool call.
        tool_call_id: nil
      )
      end

      sig { override.returns({ tool_call_id: String }) }
      def to_hash
      end
    end
  end
end
