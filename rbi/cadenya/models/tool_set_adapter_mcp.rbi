# typed: strong

module Cadenya
  module Models
    class ToolSetAdapterMCP < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetAdapterMCP, Cadenya::Internal::AnyHash)
        end

      # Top-level filter with simple boolean logic (no nesting)
      sig { returns(T.nilable(Cadenya::ToolFilter)) }
      attr_reader :exclude_tools

      sig { params(exclude_tools: Cadenya::ToolFilter::OrHash).void }
      attr_writer :exclude_tools

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      # Top-level filter with simple boolean logic (no nesting)
      sig { returns(T.nilable(Cadenya::ToolFilter)) }
      attr_reader :include_tools

      sig { params(include_tools: Cadenya::ToolFilter::OrHash).void }
      attr_writer :include_tools

      # Defines behavior for just-in-time capable tool set adapters (IE: MCP).
      sig { returns(T.nilable(Cadenya::ToolSetAdapterMCP::JustInTime)) }
      attr_reader :just_in_time

      sig do
        params(
          just_in_time: Cadenya::ToolSetAdapterMCP::JustInTime::OrHash
        ).void
      end
      attr_writer :just_in_time

      # Approval filters that will automatically set the approval requirement on tools
      # synced from an external source
      sig { returns(T.nilable(Cadenya::ApprovalRequirementFilter)) }
      attr_reader :tool_approvals

      sig do
        params(tool_approvals: Cadenya::ApprovalRequirementFilter::OrHash).void
      end
      attr_writer :tool_approvals

      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      sig do
        params(
          exclude_tools: Cadenya::ToolFilter::OrHash,
          headers: T::Hash[Symbol, String],
          include_tools: Cadenya::ToolFilter::OrHash,
          just_in_time: Cadenya::ToolSetAdapterMCP::JustInTime::OrHash,
          tool_approvals: Cadenya::ApprovalRequirementFilter::OrHash,
          url: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Top-level filter with simple boolean logic (no nesting)
        exclude_tools: nil,
        headers: nil,
        # Top-level filter with simple boolean logic (no nesting)
        include_tools: nil,
        # Defines behavior for just-in-time capable tool set adapters (IE: MCP).
        just_in_time: nil,
        # Approval filters that will automatically set the approval requirement on tools
        # synced from an external source
        tool_approvals: nil,
        url: nil
      )
      end

      sig do
        override.returns(
          {
            exclude_tools: Cadenya::ToolFilter,
            headers: T::Hash[Symbol, String],
            include_tools: Cadenya::ToolFilter,
            just_in_time: Cadenya::ToolSetAdapterMCP::JustInTime,
            tool_approvals: Cadenya::ApprovalRequirementFilter,
            url: String
          }
        )
      end
      def to_hash
      end

      class JustInTime < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ToolSetAdapterMCP::JustInTime,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :enabled

        sig { params(enabled: T::Boolean).void }
        attr_writer :enabled

        # If set, an objective will automatically be failed if tools cannot be loaded in
        # the initial stages of an objective being created. Tools are loaded
        # asynchronously, so this setting is useful for ensuring that an objective
        # continued any further if tools are not available.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :fail_objective_on_tool_list_error

        sig { params(fail_objective_on_tool_list_error: T::Boolean).void }
        attr_writer :fail_objective_on_tool_list_error

        # Defines behavior for just-in-time capable tool set adapters (IE: MCP).
        sig do
          params(
            enabled: T::Boolean,
            fail_objective_on_tool_list_error: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          enabled: nil,
          # If set, an objective will automatically be failed if tools cannot be loaded in
          # the initial stages of an objective being created. Tools are loaded
          # asynchronously, so this setting is useful for ensuring that an objective
          # continued any further if tools are not available.
          fail_objective_on_tool_list_error: nil
        )
        end

        sig do
          override.returns(
            {
              enabled: T::Boolean,
              fail_objective_on_tool_list_error: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
