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
        # empty returns all profiles (subject to the type filter).
        sig { returns(T.nilable(String)) }
        attr_reader :query

        sig { params(query: String).void }
        attr_writer :query

        # Filter by profile type. Defaults to all types when unset; pass PROFILE_TYPE_USER
        # to list only human users (the common case for a member picker).
        sig do
          returns(
            T.nilable(
              Cadenya::WorkspaceAdmin::ProfileListParams::Type::OrSymbol
            )
          )
        end
        attr_reader :type

        sig do
          params(
            type: Cadenya::WorkspaceAdmin::ProfileListParams::Type::OrSymbol
          ).void
        end
        attr_writer :type

        sig do
          params(
            cursor: String,
            limit: Integer,
            query: String,
            type: Cadenya::WorkspaceAdmin::ProfileListParams::Type::OrSymbol,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Pagination cursor from previous response
          cursor: nil,
          # Maximum number of results to return
          limit: nil,
          # Free-form search over profile name and email. Case-insensitive substring match;
          # empty returns all profiles (subject to the type filter).
          query: nil,
          # Filter by profile type. Defaults to all types when unset; pass PROFILE_TYPE_USER
          # to list only human users (the common case for a member picker).
          type: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              cursor: String,
              limit: Integer,
              query: String,
              type: Cadenya::WorkspaceAdmin::ProfileListParams::Type::OrSymbol,
              request_options: Cadenya::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Filter by profile type. Defaults to all types when unset; pass PROFILE_TYPE_USER
        # to list only human users (the common case for a member picker).
        module Type
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::WorkspaceAdmin::ProfileListParams::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PROFILE_TYPE_USER =
            T.let(
              :PROFILE_TYPE_USER,
              Cadenya::WorkspaceAdmin::ProfileListParams::Type::TaggedSymbol
            )
          PROFILE_TYPE_API_KEY =
            T.let(
              :PROFILE_TYPE_API_KEY,
              Cadenya::WorkspaceAdmin::ProfileListParams::Type::TaggedSymbol
            )
          PROFILE_TYPE_SYSTEM =
            T.let(
              :PROFILE_TYPE_SYSTEM,
              Cadenya::WorkspaceAdmin::ProfileListParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::WorkspaceAdmin::ProfileListParams::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
