# typed: strong

module Cadenya
  module Models
    class ToolSetAdapter < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetAdapter, Cadenya::Internal::AnyHash)
        end

      # Bare tool sets define tools without an execution adapter. A bare tool call
      # doesn't fire anything: the objective's workflow pauses and waits for an external
      # API consumer to set the tool call's content (e.g. human-in-the-loop tools, or a
      # reverse harness that polls for pending tool calls, executes locally, and reports
      # results back via SetToolCallContent).
      sig { returns(T.nilable(Cadenya::ToolSetAdapterBare)) }
      attr_reader :bare

      sig { params(bare: Cadenya::ToolSetAdapterBare::OrHash).void }
      attr_writer :bare

      sig { returns(T.nilable(Cadenya::ToolSetAdapterHTTP)) }
      attr_reader :http

      sig { params(http: Cadenya::ToolSetAdapterHTTP::OrHash).void }
      attr_writer :http

      sig { returns(T.nilable(Cadenya::ToolSetAdapterMcp)) }
      attr_reader :mcp

      sig { params(mcp: Cadenya::ToolSetAdapterMcp::OrHash).void }
      attr_writer :mcp

      sig { returns(T.nilable(Cadenya::ToolSetAdapterOpenAPI)) }
      attr_reader :openapi

      sig { params(openapi: Cadenya::ToolSetAdapterOpenAPI::OrHash).void }
      attr_writer :openapi

      sig do
        params(
          bare: Cadenya::ToolSetAdapterBare::OrHash,
          http: Cadenya::ToolSetAdapterHTTP::OrHash,
          mcp: Cadenya::ToolSetAdapterMcp::OrHash,
          openapi: Cadenya::ToolSetAdapterOpenAPI::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Bare tool sets define tools without an execution adapter. A bare tool call
        # doesn't fire anything: the objective's workflow pauses and waits for an external
        # API consumer to set the tool call's content (e.g. human-in-the-loop tools, or a
        # reverse harness that polls for pending tool calls, executes locally, and reports
        # results back via SetToolCallContent).
        bare: nil,
        http: nil,
        mcp: nil,
        openapi: nil
      )
      end

      sig do
        override.returns(
          {
            bare: Cadenya::ToolSetAdapterBare,
            http: Cadenya::ToolSetAdapterHTTP,
            mcp: Cadenya::ToolSetAdapterMcp,
            openapi: Cadenya::ToolSetAdapterOpenAPI
          }
        )
      end
      def to_hash
      end
    end
  end
end
