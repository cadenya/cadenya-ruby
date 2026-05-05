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
      #   Permissions granted to this key. Each entry is a colon-separated verb:resource
      #   string (e.g. "manage:agents"). Currently has no enforced effect; reserved for
      #   future fine-grained authorization.
      #
      #   @return [Array<String>, nil]
      optional :permissions, Cadenya::Internal::Type::ArrayOf[String]

      response_only do
        # @!attribute token
        #   The bearer token used to authenticate as this API key. Returned only on creation
        #   and rotation; subsequent reads omit this field.
        #
        #   @return [String, nil]
        optional :token, String

        # @!attribute system_
        #   True when this key is managed by the system (e.g. the auto-provisioned global
        #   account key). System keys cannot be deleted but can be rotated.
        #
        #   @return [Boolean, nil]
        optional :system_, Cadenya::Internal::Type::Boolean, api_name: :system
      end

      # @!method initialize(token: nil, description: nil, permissions: nil, system_: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::APIKeySpec} for more details.
      #
      #   Configuration for an API key.
      #
      #   @param token [String] The bearer token used to authenticate as this API key. Returned only on
      #
      #   @param description [String] Free-form description of what this API key is used for.
      #
      #   @param permissions [Array<String>] Permissions granted to this key. Each entry is a colon-separated
      #
      #   @param system_ [Boolean] True when this key is managed by the system (e.g. the auto-provisioned
    end
  end
end
