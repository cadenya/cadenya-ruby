# typed: strong

module Cadenya
  module Models
    class ToolSetAdapterMcp < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetAdapterMcp, Cadenya::Internal::AnyHash)
        end

      # Top-level filter with simple boolean logic (no nesting)
      sig { returns(T.nilable(Cadenya::McpToolFilter)) }
      attr_reader :exclude_tools

      sig { params(exclude_tools: Cadenya::McpToolFilter::OrHash).void }
      attr_writer :exclude_tools

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      # Top-level filter with simple boolean logic (no nesting)
      sig { returns(T.nilable(Cadenya::McpToolFilter)) }
      attr_reader :include_tools

      sig { params(include_tools: Cadenya::McpToolFilter::OrHash).void }
      attr_writer :include_tools

      # Approval filters that will automatically set the approval requirement on the
      # tools synced from the MCP server
      sig { returns(T.nilable(Cadenya::ToolSetAdapterMcp::ToolApprovals)) }
      attr_reader :tool_approvals

      sig do
        params(
          tool_approvals: Cadenya::ToolSetAdapterMcp::ToolApprovals::OrHash
        ).void
      end
      attr_writer :tool_approvals

      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      sig do
        params(
          exclude_tools: Cadenya::McpToolFilter::OrHash,
          headers: T::Hash[Symbol, String],
          include_tools: Cadenya::McpToolFilter::OrHash,
          tool_approvals: Cadenya::ToolSetAdapterMcp::ToolApprovals::OrHash,
          url: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Top-level filter with simple boolean logic (no nesting)
        exclude_tools: nil,
        headers: nil,
        # Top-level filter with simple boolean logic (no nesting)
        include_tools: nil,
        # Approval filters that will automatically set the approval requirement on the
        # tools synced from the MCP server
        tool_approvals: nil,
        url: nil
      )
      end

      sig do
        override.returns(
          {
            exclude_tools: Cadenya::McpToolFilter,
            headers: T::Hash[Symbol, String],
            include_tools: Cadenya::McpToolFilter,
            tool_approvals: Cadenya::ToolSetAdapterMcp::ToolApprovals,
            url: String
          }
        )
      end
      def to_hash
      end

      class ToolApprovals < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ToolSetAdapterMcp::ToolApprovals,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :always

        sig { params(always: T::Boolean).void }
        attr_writer :always

        # Top-level filter with simple boolean logic (no nesting)
        sig { returns(T.nilable(Cadenya::McpToolFilter)) }
        attr_reader :only

        sig { params(only: Cadenya::McpToolFilter::OrHash).void }
        attr_writer :only

        # Approval filters that will automatically set the approval requirement on the
        # tools synced from the MCP server
        sig do
          params(
            always: T::Boolean,
            only: Cadenya::McpToolFilter::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          always: nil,
          # Top-level filter with simple boolean logic (no nesting)
          only: nil
        )
        end

        sig do
          override.returns({ always: T::Boolean, only: Cadenya::McpToolFilter })
        end
        def to_hash
        end
      end
    end
  end
end
