# typed: strong

module Cadenya
  module Models
    class WorkspaceMember < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::WorkspaceMember, Cadenya::Internal::AnyHash)
        end

      # The actor row linking the profile to the workspace (the junction record). This
      # is the id used to remove the member.
      sig { returns(String) }
      attr_accessor :actor_id

      # The account profile that has access to the workspace.
      sig { returns(String) }
      attr_accessor :profile_id

      # When the member was added to the workspace.
      sig { returns(T.nilable(Time)) }
      attr_reader :added_at

      sig { params(added_at: Time).void }
      attr_writer :added_at

      # Email address of the member's profile.
      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      # Display name of the member's profile.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # A member of a workspace: the profile granted access plus the actor row that
      # links it to the workspace. Returned by member list/add operations.
      sig do
        params(
          actor_id: String,
          profile_id: String,
          added_at: Time,
          email: String,
          name: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The actor row linking the profile to the workspace (the junction record). This
        # is the id used to remove the member.
        actor_id:,
        # The account profile that has access to the workspace.
        profile_id:,
        # When the member was added to the workspace.
        added_at: nil,
        # Email address of the member's profile.
        email: nil,
        # Display name of the member's profile.
        name: nil
      )
      end

      sig do
        override.returns(
          {
            actor_id: String,
            profile_id: String,
            added_at: Time,
            email: String,
            name: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
