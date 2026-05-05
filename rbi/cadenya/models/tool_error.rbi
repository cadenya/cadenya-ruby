# typed: strong

module Cadenya
  module Models
    class ToolError < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::ToolError, Cadenya::Internal::AnyHash) }

      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      # The ID of the objective tool call record that encountered an error during
      # execution.
      sig { returns(T.nilable(String)) }
      attr_reader :tool_call_id

      sig { params(tool_call_id: String).void }
      attr_writer :tool_call_id

      sig do
        params(message: String, tool_call_id: String).returns(T.attached_class)
      end
      def self.new(
        message: nil,
        # The ID of the objective tool call record that encountered an error during
        # execution.
        tool_call_id: nil
      )
      end

      sig { override.returns({ message: String, tool_call_id: String }) }
      def to_hash
      end
    end
  end
end
