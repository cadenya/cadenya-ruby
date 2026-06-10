# typed: strong

module Cadenya
  module Models
    class ToolResult < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::ToolResult, Cadenya::Internal::AnyHash) }

      # ObjectiveToolCallResult is the content a tool returned after execution. Tools
      # can return multiple content blocks, and blocks can be multi-modal (text, image,
      # audio). Media blocks are stored by Cadenya and served as short-lived signed URLs
      # rather than inline bytes.
      sig { returns(Cadenya::Objectives::ObjectiveToolCallResult) }
      attr_reader :result

      sig do
        params(
          result: Cadenya::Objectives::ObjectiveToolCallResult::OrHash
        ).void
      end
      attr_writer :result

      sig { returns(String) }
      attr_accessor :tool_call_id

      sig do
        params(
          result: Cadenya::Objectives::ObjectiveToolCallResult::OrHash,
          tool_call_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        # ObjectiveToolCallResult is the content a tool returned after execution. Tools
        # can return multiple content blocks, and blocks can be multi-modal (text, image,
        # audio). Media blocks are stored by Cadenya and served as short-lived signed URLs
        # rather than inline bytes.
        result:,
        tool_call_id:
      )
      end

      sig do
        override.returns(
          {
            result: Cadenya::Objectives::ObjectiveToolCallResult,
            tool_call_id: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
