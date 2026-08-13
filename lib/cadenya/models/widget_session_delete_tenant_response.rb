# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::WidgetSessions#delete_tenant
    class WidgetSessionDeleteTenantResponse < Cadenya::Internal::Type::BaseModel
      response_only do
        # @!attribute objectives_deleted
        #   Number of conversations (objectives) deleted along with the sessions.
        #
        #   @return [Integer]
        required :objectives_deleted, Integer, api_name: :objectivesDeleted

        # @!attribute sessions_deleted
        #   Number of sessions deleted.
        #
        #   @return [Integer]
        required :sessions_deleted, Integer, api_name: :sessionsDeleted
      end

      # @!method initialize(objectives_deleted:, sessions_deleted:)
      #   Delete tenant widget sessions response.
      #
      #   @param objectives_deleted [Integer] Number of conversations (objectives) deleted along with the sessions.
      #
      #   @param sessions_deleted [Integer] Number of sessions deleted.
    end
  end
end
