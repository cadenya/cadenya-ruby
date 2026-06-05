# typed: strong

module Cadenya
  module Models
    module Workspaces
      class MemberAddParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Workspaces::MemberAddParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        # The existing account profile to add to the workspace.
        sig { returns(T.nilable(String)) }
        attr_reader :profile_id

        sig { params(profile_id: String).void }
        attr_writer :profile_id

        sig do
          params(
            workspace_id: String,
            profile_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          workspace_id:,
          # The existing account profile to add to the workspace.
          profile_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
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
