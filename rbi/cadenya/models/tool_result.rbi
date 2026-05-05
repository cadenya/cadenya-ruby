# typed: strong

module Cadenya
  module Models
    class ToolResult < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::ToolResult, Cadenya::Internal::AnyHash) }

      sig { returns(T.nilable(String)) }
      attr_reader :content

      sig { params(content: String).void }
      attr_writer :content

      sig { returns(T.nilable(String)) }
      attr_reader :tool_call_id

      sig { params(tool_call_id: String).void }
      attr_writer :tool_call_id

      sig do
        params(content: String, tool_call_id: String).returns(T.attached_class)
      end
      def self.new(content: nil, tool_call_id: nil)
      end

      sig { override.returns({ content: String, tool_call_id: String }) }
      def to_hash
      end
    end
  end
end
