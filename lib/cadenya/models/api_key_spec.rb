# frozen_string_literal: true

module Cadenya
  module Models
    class APIKeySpec < Cadenya::Internal::Type::BaseModel
      # @!attribute description
      #   Free-form description of what this API key is used for.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute permissions
      #   Scopes granted to this key. Each entry is a colon-separated resource:verb string
      #   (e.g. "objectives:manage").
      #
      #   Resources: agents, objectives, tools, memory, api_keys, workspaces, widgets,
      #   widget_sessions, secrets, account. Verbs: read and manage, where manage implies
      #   read — a stored scope set is normalized to drop "x:read" when "x:manage" is
      #   present. The secrets and account resources support only manage. "\*" is an
      #   explicit full-access grant.
      #
      #   Scopes are deny-by-default: a key with an empty list can call only scope-free
      #   endpoints. Full access is always an explicit "\*" grant.
      #
      #   @return [Array<String>, nil]
      optional :permissions, Cadenya::Internal::Type::ArrayOf[String]

      response_only do
        # @!attribute token
        #   The bearer token used to authenticate as this API key. Returned only on creation
        #   and rotation; subsequent reads omit this field.
        #
        #   @return [String]
        required :token, String

        # @!attribute system_
        #   True when this key is managed by the system (i.e. the auto-provisioned global
        #   account key). System keys cannot be deleted but can be rotated.
        #
        #   @return [Boolean]
        required :system_, Cadenya::Internal::Type::Boolean, api_name: :system
      end

      # @!method initialize(token:, description: nil, permissions: nil, system_:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::APIKeySpec} for more details.
      #
      #   Configuration for an API key.
      #
      #   @param token [String] The bearer token used to authenticate as this API key. Returned only on
      #
      #   @param description [String] Free-form description of what this API key is used for.
      #
      #   @param permissions [Array<String>] Scopes granted to this key. Each entry is a colon-separated
      #
      #   @param system_ [Boolean] True when this key is managed by the system (i.e. the auto-provisioned
    end
  end
end
