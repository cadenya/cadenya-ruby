# typed: strong

module Cadenya
  module Models
    module Tenants
      class SubjectListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Tenants::SubjectListParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { params(workspace_id: String).void }
        attr_writer :workspace_id

        sig { returns(String) }
        attr_accessor :tenant_id

        # Pagination cursor from previous response.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # When true, the `info` field on each returned subject is populated.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_info

        sig { params(include_info: T::Boolean).void }
        attr_writer :include_info

        # Maximum number of results to return.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Substring match against the subject's name and external_id.
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
            tenant_id: String,
            workspace_id: String,
            cursor: String,
            include_info: T::Boolean,
            limit: Integer,
            query: String,
            sort_order: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          tenant_id:,
          workspace_id: nil,
          # Pagination cursor from previous response.
          cursor: nil,
          # When true, the `info` field on each returned subject is populated.
          include_info: nil,
          # Maximum number of results to return.
          limit: nil,
          # Substring match against the subject's name and external_id.
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
              tenant_id: String,
              cursor: String,
              include_info: T::Boolean,
              limit: Integer,
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
