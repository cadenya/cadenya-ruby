# typed: strong

module Cadenya
  module Models
    class ToolSetAdapterBare < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetAdapterBare, Cadenya::Internal::AnyHash)
        end

      # How long to wait for content to be set before the tool call errors. If unset,
      # the call waits indefinitely.
      sig { returns(T.nilable(Integer)) }
      attr_reader :content_timeout

      sig { params(content_timeout: Integer).void }
      attr_writer :content_timeout

      # Bare tool sets define tools without an execution adapter. A bare tool call
      # doesn't fire anything: the objective's workflow pauses and waits for an external
      # API consumer to set the tool call's content (e.g. human-in-the-loop tools, or a
      # reverse harness that polls for pending tool calls, executes locally, and reports
      # results back via SetToolCallContent).
      sig { params(content_timeout: Integer).returns(T.attached_class) }
      def self.new(
        # How long to wait for content to be set before the tool call errors. If unset,
        # the call waits indefinitely.
        content_timeout: nil
      )
      end

      sig { override.returns({ content_timeout: Integer }) }
      def to_hash
      end
    end
  end
end
