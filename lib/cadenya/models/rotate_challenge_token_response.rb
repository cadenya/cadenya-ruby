# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Account#rotate_challenge_token
    class RotateChallengeTokenResponse < Cadenya::Internal::Type::BaseModel
      # @!attribute challenge_token
      #
      #   @return [String]
      required :challenge_token, String, api_name: :challengeToken

      # @!method initialize(challenge_token:)
      #   Response containing the newly generated challenge token.
      #
      #   @param challenge_token [String]
    end
  end
end
