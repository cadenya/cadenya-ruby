# typed: strong

module Cadenya
  module Models
    class WorkspaceAdminListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::WorkspaceAdminListParams, Cadenya::Internal::AnyHash)
        end

      # Pagination cursor from previous response
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # When true, archived workspaces are included in the results. Defaults to false
      # (active workspaces only).
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_archived

      sig { params(include_archived: T::Boolean).void }
      attr_writer :include_archived

      # Filters by metadata labels. Comma-separated key=value pairs, e.g.
      # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
      # semantics).
      sig { returns(T.nilable(String)) }
      attr_reader :labels

      sig { params(labels: String).void }
      attr_writer :labels

      # Maximum number of results to return
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          cursor: String,
          include_archived: T::Boolean,
          labels: String,
          limit: Integer,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Pagination cursor from previous response
        cursor: nil,
        # When true, archived workspaces are included in the results. Defaults to false
        # (active workspaces only).
        include_archived: nil,
        # Filters by metadata labels. Comma-separated key=value pairs, e.g.
        # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        # semantics).
        labels: nil,
        # Maximum number of results to return
        limit: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            include_archived: T::Boolean,
            labels: String,
            limit: Integer,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
