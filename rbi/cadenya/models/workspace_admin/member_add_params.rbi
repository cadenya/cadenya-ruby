# typed: strong

module Cadenya
  module Models
    module WorkspaceAdmin
      class MemberAddParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::WorkspaceAdmin::MemberAddParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { params(workspace_id: String).void }
        attr_writer :workspace_id

        # Email address to add (resolve-or-invite). Mutually exclusive with profile_id.
        sig { returns(T.nilable(String)) }
        attr_reader :email

        sig { params(email: String).void }
        attr_writer :email

        # An existing account profile to add. Mutually exclusive with email.
        sig { returns(T.nilable(String)) }
        attr_reader :profile_id

        sig { params(profile_id: String).void }
        attr_writer :profile_id

        sig do
          params(
            workspace_id: String,
            email: String,
            profile_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          workspace_id: nil,
          # Email address to add (resolve-or-invite). Mutually exclusive with profile_id.
          email: nil,
          # An existing account profile to add. Mutually exclusive with email.
          profile_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              email: String,
              profile_id: String,
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
