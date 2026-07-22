# typed: strong

module Cadenya
  module Models
    class ToolSetListUsageParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetListUsageParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :workspace_id

      sig { params(workspace_id: String).void }
      attr_writer :workspace_id

      sig { returns(String) }
      attr_accessor :tool_set_id

      # Pagination cursor from previous response
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Maximum number of results to return
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Sort order for results (asc or desc by assignment creation time)
      sig { returns(T.nilable(String)) }
      attr_reader :sort_order

      sig { params(sort_order: String).void }
      attr_writer :sort_order

      # When set, lists only variations with a direct assignment of this individual
      # tool. When unset, lists variations assigned the whole tool set. The tool must
      # belong to the tool set.
      sig { returns(T.nilable(String)) }
      attr_reader :tool_id

      sig { params(tool_id: String).void }
      attr_writer :tool_id

      sig do
        params(
          tool_set_id: String,
          workspace_id: String,
          cursor: String,
          limit: Integer,
          sort_order: String,
          tool_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        tool_set_id:,
        workspace_id: nil,
        # Pagination cursor from previous response
        cursor: nil,
        # Maximum number of results to return
        limit: nil,
        # Sort order for results (asc or desc by assignment creation time)
        sort_order: nil,
        # When set, lists only variations with a direct assignment of this individual
        # tool. When unset, lists variations assigned the whole tool set. The tool must
        # belong to the tool set.
        tool_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            tool_set_id: String,
            cursor: String,
            limit: Integer,
            sort_order: String,
            tool_id: String,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
