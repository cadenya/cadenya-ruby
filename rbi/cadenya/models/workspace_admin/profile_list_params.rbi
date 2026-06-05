# typed: strong

module Cadenya
  module Models
    module WorkspaceAdmin
      class ProfileListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::WorkspaceAdmin::ProfileListParams,
              Cadenya::Internal::AnyHash
            )
          end

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

        # Free-form search over profile name and email. Case-insensitive substring match;
        # empty returns all profiles.
        sig { returns(T.nilable(String)) }
        attr_reader :query

        sig { params(query: String).void }
        attr_writer :query

        sig do
          params(
            cursor: String,
            limit: Integer,
            query: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Pagination cursor from previous response
          cursor: nil,
          # Maximum number of results to return
          limit: nil,
          # Free-form search over profile name and email. Case-insensitive substring match;
          # empty returns all profiles.
          query: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              cursor: String,
              limit: Integer,
              query: String,
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
