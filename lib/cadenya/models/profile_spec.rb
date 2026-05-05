# frozen_string_literal: true

module Cadenya
  module Models
    class ProfileSpec < Cadenya::Internal::Type::BaseModel
      # @!attribute type
      #   Whether this profile represents a human user, an API key, or a system principal.
      #
      #   @return [Symbol, Cadenya::Models::ProfileSpec::Type]
      required :type, enum: -> { Cadenya::ProfileSpec::Type }

      # @!attribute email
      #   Email address of the profile. Required and unique within an account for user
      #   profiles.
      #
      #   @return [String, nil]
      optional :email, String

      # @!attribute name
      #   Display name (e.g., "Bobby Tables").
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(type:, email: nil, name: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ProfileSpec} for more details.
      #
      #   Configuration for a profile.
      #
      #   @param type [Symbol, Cadenya::Models::ProfileSpec::Type] Whether this profile represents a human user, an API key, or a system
      #
      #   @param email [String] Email address of the profile. Required and unique within an account for
      #
      #   @param name [String] Display name (e.g., "Bobby Tables").

      # Whether this profile represents a human user, an API key, or a system principal.
      #
      # @see Cadenya::Models::ProfileSpec#type
      module Type
        extend Cadenya::Internal::Type::Enum

        PROFILE_TYPE_USER = :PROFILE_TYPE_USER
        PROFILE_TYPE_API_KEY = :PROFILE_TYPE_API_KEY
        PROFILE_TYPE_SYSTEM = :PROFILE_TYPE_SYSTEM

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
