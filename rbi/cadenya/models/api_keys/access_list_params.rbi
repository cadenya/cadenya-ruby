# typed: strong

module Cadenya
  module Models
    module APIKeys
      class AccessListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::APIKeys::AccessListParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Pagination cursor from previous response.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Maximum number of results to return.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        sig do
          params(
            id: String,
            cursor: String,
            limit: Integer,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Pagination cursor from previous response.
          cursor: nil,
          # Maximum number of results to return.
          limit: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              cursor: String,
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
end
