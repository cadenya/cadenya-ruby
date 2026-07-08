# typed: strong

module Cadenya
  module Models
    module Agents
      class ScheduleListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::ScheduleListParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        sig { returns(String) }
        attr_accessor :agent_id

        # Pagination cursor from previous response.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # When true, the `info` field on each returned schedule is populated. Requests
        # with this flag count more against your rate limit.
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

        # Filter expression (query param: prefix).
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
            workspace_id: String,
            agent_id: String,
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
          workspace_id:,
          agent_id:,
          # Pagination cursor from previous response.
          cursor: nil,
          # When true, the `info` field on each returned schedule is populated. Requests
          # with this flag count more against your rate limit.
          include_info: nil,
          # Filters by metadata labels. Comma-separated key=value pairs, e.g.
          # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
          # semantics).
          labels: nil,
          # Maximum number of results to return.
          limit: nil,
          # Filter expression (query param: prefix).
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
              workspace_id: String,
              agent_id: String,
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
end
