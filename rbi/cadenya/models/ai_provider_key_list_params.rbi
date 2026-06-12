# typed: strong

module Cadenya
  module Models
    class AIProviderKeyListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::AIProviderKeyListParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :workspace_id

      # Pagination cursor from previous response
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # When true, populate each item's info (model counts), at the cost of extra
      # lookups.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_info

      sig { params(include_info: T::Boolean).void }
      attr_writer :include_info

      # Maximum number of results to return
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Filter expression (query param: prefix)
      sig { returns(T.nilable(String)) }
      attr_reader :prefix

      sig { params(prefix: String).void }
      attr_writer :prefix

      # When true, return only promotional keys (provided by Cadenya, e.g. for
      # onboarding). Defaults to returning all keys, customer-provided and promotional
      # alike.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :promotional

      sig { params(promotional: T::Boolean).void }
      attr_writer :promotional

      # Free-form search query
      sig { returns(T.nilable(String)) }
      attr_reader :query

      sig { params(query: String).void }
      attr_writer :query

      # Sort order for results (asc or desc by creation time)
      sig { returns(T.nilable(String)) }
      attr_reader :sort_order

      sig { params(sort_order: String).void }
      attr_writer :sort_order

      sig do
        params(
          workspace_id: String,
          cursor: String,
          include_info: T::Boolean,
          limit: Integer,
          prefix: String,
          promotional: T::Boolean,
          query: String,
          sort_order: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        workspace_id:,
        # Pagination cursor from previous response
        cursor: nil,
        # When true, populate each item's info (model counts), at the cost of extra
        # lookups.
        include_info: nil,
        # Maximum number of results to return
        limit: nil,
        # Filter expression (query param: prefix)
        prefix: nil,
        # When true, return only promotional keys (provided by Cadenya, e.g. for
        # onboarding). Defaults to returning all keys, customer-provided and promotional
        # alike.
        promotional: nil,
        # Free-form search query
        query: nil,
        # Sort order for results (asc or desc by creation time)
        sort_order: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            cursor: String,
            include_info: T::Boolean,
            limit: Integer,
            prefix: String,
            promotional: T::Boolean,
            query: String,
            sort_order: String,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
