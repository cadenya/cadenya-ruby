# typed: strong

module Cadenya
  module Models
    class ObjectiveListContextWindowsParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveListContextWindowsParams,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :workspace_id

      sig { returns(String) }
      attr_accessor :objective_id

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
          workspace_id: String,
          objective_id: String,
          cursor: String,
          include_info: T::Boolean,
          labels: String,
          limit: Integer,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        workspace_id:,
        objective_id:,
        # Pagination cursor from previous response
        cursor: nil,
        # When set to true you may use more of your alloted API rate-limit
        include_info: nil,
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
            workspace_id: String,
            objective_id: String,
            cursor: String,
            include_info: T::Boolean,
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
