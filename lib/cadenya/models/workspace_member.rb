# frozen_string_literal: true

module Cadenya
  module Models
    class WorkspaceMember < Cadenya::Internal::Type::BaseModel
      response_only do
        # @!attribute actor_id
        #   The actor row linking the profile to the workspace (the junction record).
        #
        #   @return [String]
        required :actor_id, String, api_name: :actorId

        # @!attribute profile_id
        #   The account profile that has access to the workspace.
        #
        #   @return [String]
        required :profile_id, String, api_name: :profileId

        # @!attribute added_at
        #   When the member was added to the workspace.
        #
        #   @return [Time, nil]
        optional :added_at, Time, api_name: :addedAt

        # @!attribute email
        #   Email address of the member's profile.
        #
        #   @return [String]
        required :email, String

        # @!attribute name
        #   Display name of the member's profile.
        #
        #   @return [String]
        required :name, String
      end

      # @!method initialize(actor_id:, profile_id:, added_at: nil, email:, name:)
      #   A member of a workspace: the profile granted access plus the actor row that
      #   links it to the workspace. Returned by member list/add operations.
      #
      #   @param actor_id [String] The actor row linking the profile to the workspace (the junction record).
      #
      #   @param profile_id [String] The account profile that has access to the workspace.
      #
      #   @param added_at [Time] When the member was added to the workspace.
      #
      #   @param email [String] Email address of the member's profile.
      #
      #   @param name [String] Display name of the member's profile.
    end
  end
end
