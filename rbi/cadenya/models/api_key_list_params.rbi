# typed: strong

module Cadenya
  module Models
    class APIKeyListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::APIKeyListParams, Cadenya::Internal::AnyHash)
        end

      # Pagination cursor from previous response.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # When true, included info fields are populated. Requests with this flag count
      # more against your rate limit.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_info

      sig { params(include_info: T::Boolean).void }
      attr_writer :include_info

      # Filters by metadata labels. Comma-separated key=value pairs, e.g.
      # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
      # semantics).
      sig { returns(T.nilable(String)) }
      attr_reader :labels

      sig { params(labels: String).void }
      attr_writer :labels

      # Maximum number of results to return.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Filter by ID prefix.
      sig { returns(T.nilable(String)) }
      attr_reader :prefix

      sig { params(prefix: String).void }
      attr_writer :prefix

      # Free-form search query.
      sig { returns(T.nilable(String)) }
      attr_reader :query

      sig { params(query: String).void }
      attr_writer :query

      # Sort order for results (asc or desc by creation time).
      sig { returns(T.nilable(String)) }
      attr_reader :sort_order

      sig { params(sort_order: String).void }
      attr_writer :sort_order

      sig do
        params(
          cursor: String,
          include_info: T::Boolean,
          labels: String,
          limit: Integer,
          prefix: String,
          query: String,
          sort_order: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Pagination cursor from previous response.
        cursor: nil,
        # When true, included info fields are populated. Requests with this flag count
        # more against your rate limit.
        include_info: nil,
        # Filters by metadata labels. Comma-separated key=value pairs, e.g.
        # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        # semantics).
        labels: nil,
        # Maximum number of results to return.
        limit: nil,
        # Filter by ID prefix.
        prefix: nil,
        # Free-form search query.
        query: nil,
        # Sort order for results (asc or desc by creation time).
        sort_order: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            include_info: T::Boolean,
            labels: String,
            limit: Integer,
            prefix: String,
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
