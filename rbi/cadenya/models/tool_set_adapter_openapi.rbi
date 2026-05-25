# typed: strong

module Cadenya
  module Models
    class ToolSetAdapterOpenAPI < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetAdapterOpenAPI, Cadenya::Internal::AnyHash)
        end

      # Base URL for dispatching tool calls. If set, overrides the server resolved from
      # the spec's servers array.
      sig { returns(T.nilable(String)) }
      attr_reader :base_url

      sig { params(base_url: String).void }
      attr_writer :base_url

      # Top-level filter with simple boolean logic (no nesting)
      sig { returns(T.nilable(Cadenya::ToolFilter)) }
      attr_reader :exclude_tools

      sig { params(exclude_tools: Cadenya::ToolFilter::OrHash).void }
      attr_writer :exclude_tools

      # Headers sent when fetching the spec from a URL and when dispatching tool calls.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      # Top-level filter with simple boolean logic (no nesting)
      sig { returns(T.nilable(Cadenya::ToolFilter)) }
      attr_reader :include_tools

      sig { params(include_tools: Cadenya::ToolFilter::OrHash).void }
      attr_writer :include_tools

      # Name of the server entry in the spec's servers array (OpenAPI 3.2 server.name
      # field). Used to select which server URL to dispatch to when base_url is not set.
      # If unset, the first server is used. Ignored when base_url is set.
      sig { returns(T.nilable(String)) }
      attr_reader :server_name

      sig { params(server_name: String).void }
      attr_writer :server_name

      # Approval filters that will automatically set the approval requirement on tools
      # synced from an external source
      sig { returns(T.nilable(Cadenya::ApprovalRequirementFilter)) }
      attr_reader :tool_approvals

      sig do
        params(tool_approvals: Cadenya::ApprovalRequirementFilter::OrHash).void
      end
      attr_writer :tool_approvals

      # ID of a COMPLETE Upload containing the OpenAPI spec document.
      sig { returns(T.nilable(String)) }
      attr_reader :upload_id

      sig { params(upload_id: String).void }
      attr_writer :upload_id

      # URL to fetch the OpenAPI spec from. Synced automatically every hour.
      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      sig do
        params(
          base_url: String,
          exclude_tools: Cadenya::ToolFilter::OrHash,
          headers: T::Hash[Symbol, String],
          include_tools: Cadenya::ToolFilter::OrHash,
          server_name: String,
          tool_approvals: Cadenya::ApprovalRequirementFilter::OrHash,
          upload_id: String,
          url: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Base URL for dispatching tool calls. If set, overrides the server resolved from
        # the spec's servers array.
        base_url: nil,
        # Top-level filter with simple boolean logic (no nesting)
        exclude_tools: nil,
        # Headers sent when fetching the spec from a URL and when dispatching tool calls.
        headers: nil,
        # Top-level filter with simple boolean logic (no nesting)
        include_tools: nil,
        # Name of the server entry in the spec's servers array (OpenAPI 3.2 server.name
        # field). Used to select which server URL to dispatch to when base_url is not set.
        # If unset, the first server is used. Ignored when base_url is set.
        server_name: nil,
        # Approval filters that will automatically set the approval requirement on tools
        # synced from an external source
        tool_approvals: nil,
        # ID of a COMPLETE Upload containing the OpenAPI spec document.
        upload_id: nil,
        # URL to fetch the OpenAPI spec from. Synced automatically every hour.
        url: nil
      )
      end

      sig do
        override.returns(
          {
            base_url: String,
            exclude_tools: Cadenya::ToolFilter,
            headers: T::Hash[Symbol, String],
            include_tools: Cadenya::ToolFilter,
            server_name: String,
            tool_approvals: Cadenya::ApprovalRequirementFilter,
            upload_id: String,
            url: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
