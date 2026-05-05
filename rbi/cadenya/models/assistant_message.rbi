# typed: strong

module Cadenya
  module Models
    class AssistantMessage < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::AssistantMessage, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :content

      sig { params(content: String).void }
      attr_writer :content

      sig { returns(T.nilable(T::Array[Cadenya::AssistantToolCall])) }
      attr_reader :tool_calls

      sig do
        params(tool_calls: T::Array[Cadenya::AssistantToolCall::OrHash]).void
      end
      attr_writer :tool_calls

      sig do
        params(
          content: String,
          tool_calls: T::Array[Cadenya::AssistantToolCall::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(content: nil, tool_calls: nil)
      end

      sig do
        override.returns(
          { content: String, tool_calls: T::Array[Cadenya::AssistantToolCall] }
        )
      end
      def to_hash
      end
    end
  end
end
