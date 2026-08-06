# typed: strong

module Cadenya
  module Models
    class ToolSetAdapterOpenAPIURL < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetAdapterOpenAPIURL, Cadenya::Internal::AnyHash)
        end

      sig { returns(Cadenya::ToolSetAdapterOpenAPIURL::Type::OrSymbol) }
      attr_accessor :type

      # URL to fetch the OpenAPI spec from. Synced automatically every hour.
      sig { returns(String) }
      attr_accessor :url

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
      sig do
        returns(
          T.nilable(
            T.any(
              Cadenya::ApprovalRequirementFilterAlways,
              Cadenya::ApprovalRequirementFilterOnly
            )
          )
        )
      end
      attr_reader :tool_approvals

      sig do
        params(
          tool_approvals:
            T.any(
              Cadenya::ApprovalRequirementFilterAlways::OrHash,
              Cadenya::ApprovalRequirementFilterOnly::OrHash
            )
        ).void
      end
      attr_writer :tool_approvals

      sig do
        params(
          type: Cadenya::ToolSetAdapterOpenAPIURL::Type::OrSymbol,
          url: String,
          base_url: String,
          exclude_tools: Cadenya::ToolFilter::OrHash,
          headers: T::Hash[Symbol, String],
          include_tools: Cadenya::ToolFilter::OrHash,
          server_name: String,
          tool_approvals:
            T.any(
              Cadenya::ApprovalRequirementFilterAlways::OrHash,
              Cadenya::ApprovalRequirementFilterOnly::OrHash
            )
        ).returns(T.attached_class)
      end
      def self.new(
        type:,
        # URL to fetch the OpenAPI spec from. Synced automatically every hour.
        url:,
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
        tool_approvals: nil
      )
      end

      sig do
        override.returns(
          {
            type: Cadenya::ToolSetAdapterOpenAPIURL::Type::OrSymbol,
            url: String,
            base_url: String,
            exclude_tools: Cadenya::ToolFilter,
            headers: T::Hash[Symbol, String],
            include_tools: Cadenya::ToolFilter,
            server_name: String,
            tool_approvals:
              T.any(
                Cadenya::ApprovalRequirementFilterAlways,
                Cadenya::ApprovalRequirementFilterOnly
              )
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ToolSetAdapterOpenAPIURL::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        URL = T.let(:url, Cadenya::ToolSetAdapterOpenAPIURL::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::ToolSetAdapterOpenAPIURL::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
