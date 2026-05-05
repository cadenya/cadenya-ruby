# typed: strong

module Cadenya
  module Models
    module ToolSets
      class ToolListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(Cadenya::ToolSets::ToolListParams, Cadenya::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        sig { returns(String) }
        attr_accessor :tool_set_id

        # Filter by bundle_key — return only resources owned by this bundle.
        sig { returns(T.nilable(String)) }
        attr_reader :bundle_key

        sig { params(bundle_key: String).void }
        attr_writer :bundle_key

        # Pagination cursor from previous response
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # When set to true you may use more of your alloted API rate-limit
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_info

        sig { params(include_info: T::Boolean).void }
        attr_writer :include_info

        # Maximum number of results to return
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Filter by tool name (exact match). Multiple values are OR'd together.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :names

        sig { params(names: T::Array[String]).void }
        attr_writer :names

        # Filter expression (query param: prefix)
        sig { returns(T.nilable(String)) }
        attr_reader :prefix

        sig { params(prefix: String).void }
        attr_writer :prefix

        # Free-form search query
        sig { returns(T.nilable(String)) }
        attr_reader :query

        sig { params(query: String).void }
        attr_writer :query

        # Filter by approval requirement. Omitted = no filter; true = only tools requiring
        # approval; false = only tools not requiring approval.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :requires_approval

        sig { params(requires_approval: T::Boolean).void }
        attr_writer :requires_approval

        # Sort order for results (asc or desc by creation time)
        sig { returns(T.nilable(String)) }
        attr_reader :sort_order

        sig { params(sort_order: String).void }
        attr_writer :sort_order

        # Filter by tool status. Multiple values are OR'd together.
        sig do
          returns(
            T.nilable(
              T::Array[Cadenya::ToolSets::ToolListParams::Status::OrSymbol]
            )
          )
        end
        attr_reader :statuses

        sig do
          params(
            statuses:
              T::Array[Cadenya::ToolSets::ToolListParams::Status::OrSymbol]
          ).void
        end
        attr_writer :statuses

        sig do
          params(
            workspace_id: String,
            tool_set_id: String,
            bundle_key: String,
            cursor: String,
            include_info: T::Boolean,
            limit: Integer,
            names: T::Array[String],
            prefix: String,
            query: String,
            requires_approval: T::Boolean,
            sort_order: String,
            statuses:
              T::Array[Cadenya::ToolSets::ToolListParams::Status::OrSymbol],
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          workspace_id:,
          tool_set_id:,
          # Filter by bundle_key — return only resources owned by this bundle.
          bundle_key: nil,
          # Pagination cursor from previous response
          cursor: nil,
          # When set to true you may use more of your alloted API rate-limit
          include_info: nil,
          # Maximum number of results to return
          limit: nil,
          # Filter by tool name (exact match). Multiple values are OR'd together.
          names: nil,
          # Filter expression (query param: prefix)
          prefix: nil,
          # Free-form search query
          query: nil,
          # Filter by approval requirement. Omitted = no filter; true = only tools requiring
          # approval; false = only tools not requiring approval.
          requires_approval: nil,
          # Sort order for results (asc or desc by creation time)
          sort_order: nil,
          # Filter by tool status. Multiple values are OR'd together.
          statuses: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              tool_set_id: String,
              bundle_key: String,
              cursor: String,
              include_info: T::Boolean,
              limit: Integer,
              names: T::Array[String],
              prefix: String,
              query: String,
              requires_approval: T::Boolean,
              sort_order: String,
              statuses:
                T::Array[Cadenya::ToolSets::ToolListParams::Status::OrSymbol],
              request_options: Cadenya::RequestOptions
            }
          )
        end
        def to_hash
        end

        module Status
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::ToolSets::ToolListParams::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TOOL_STATUS_UNSPECIFIED =
            T.let(
              :TOOL_STATUS_UNSPECIFIED,
              Cadenya::ToolSets::ToolListParams::Status::TaggedSymbol
            )
          TOOL_STATUS_AVAILABLE =
            T.let(
              :TOOL_STATUS_AVAILABLE,
              Cadenya::ToolSets::ToolListParams::Status::TaggedSymbol
            )
          TOOL_STATUS_OMITTED =
            T.let(
              :TOOL_STATUS_OMITTED,
              Cadenya::ToolSets::ToolListParams::Status::TaggedSymbol
            )
          TOOL_STATUS_ARCHIVED =
            T.let(
              :TOOL_STATUS_ARCHIVED,
              Cadenya::ToolSets::ToolListParams::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Cadenya::ToolSets::ToolListParams::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
