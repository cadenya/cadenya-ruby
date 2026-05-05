# typed: strong

module Cadenya
  module Models
    class ToolSetAdapter < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetAdapter, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(Cadenya::ToolSetAdapterHTTP)) }
      attr_reader :http

      sig { params(http: Cadenya::ToolSetAdapterHTTP::OrHash).void }
      attr_writer :http

      sig { returns(T.nilable(Cadenya::ToolSetAdapterMcp)) }
      attr_reader :mcp

      sig { params(mcp: Cadenya::ToolSetAdapterMcp::OrHash).void }
      attr_writer :mcp

      sig do
        params(
          http: Cadenya::ToolSetAdapterHTTP::OrHash,
          mcp: Cadenya::ToolSetAdapterMcp::OrHash
        ).returns(T.attached_class)
      end
      def self.new(http: nil, mcp: nil)
      end

      sig do
        override.returns(
          { http: Cadenya::ToolSetAdapterHTTP, mcp: Cadenya::ToolSetAdapterMcp }
        )
      end
      def to_hash
      end
    end
  end
end
