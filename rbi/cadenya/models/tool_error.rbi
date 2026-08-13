# typed: strong

module Cadenya
  module Models
    class ToolError < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::ToolError, Cadenya::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :message

      # The ID of the objective tool call record that encountered an error during
      # execution.
      sig { returns(String) }
      attr_accessor :tool_call_id

      sig do
        params(message: String, tool_call_id: String).returns(T.attached_class)
      end
      def self.new(
        message:,
        # The ID of the objective tool call record that encountered an error during
        # execution.
        tool_call_id:
      )
      end

      sig { override.returns({ message: String, tool_call_id: String }) }
      def to_hash
      end
    end
  end
end
