# typed: strong

module Cadenya
  module Models
    module Agents
      class VariationListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::VariationListParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        sig { returns(String) }
        attr_accessor :agent_id

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

        # When true, the `info` field on each returned variation is populated. Requests
        # with this flag count more against your rate limit.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_info

        sig { params(include_info: T::Boolean).void }
        attr_writer :include_info

        # Maximum number of results to return
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Sort order for results (asc or desc by creation time)
        sig { returns(T.nilable(String)) }
        attr_reader :sort_order

        sig { params(sort_order: String).void }
        attr_writer :sort_order

        sig do
          params(
            workspace_id: String,
            agent_id: String,
            bundle_key: String,
            cursor: String,
            include_info: T::Boolean,
            limit: Integer,
            sort_order: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          workspace_id:,
          agent_id:,
          # Filter by bundle_key — return only resources owned by this bundle.
          bundle_key: nil,
          # Pagination cursor from previous response
          cursor: nil,
          # When true, the `info` field on each returned variation is populated. Requests
          # with this flag count more against your rate limit.
          include_info: nil,
          # Maximum number of results to return
          limit: nil,
          # Sort order for results (asc or desc by creation time)
          sort_order: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              agent_id: String,
              bundle_key: String,
              cursor: String,
              include_info: T::Boolean,
              limit: Integer,
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
