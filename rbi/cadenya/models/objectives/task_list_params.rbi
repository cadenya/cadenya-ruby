# typed: strong

module Cadenya
  module Models
    module Objectives
      class TaskListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::TaskListParams,
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

        # Maximum number of results to return
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Sort order for results
        sig { returns(T.nilable(String)) }
        attr_reader :sort_order

        sig { params(sort_order: String).void }
        attr_writer :sort_order

        sig do
          params(
            workspace_id: String,
            objective_id: String,
            cursor: String,
            limit: Integer,
            sort_order: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          workspace_id:,
          objective_id:,
          # Pagination cursor from previous response
          cursor: nil,
          # Maximum number of results to return
          limit: nil,
          # Sort order for results
          sort_order: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              objective_id: String,
              cursor: String,
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
