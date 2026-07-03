# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Account#rotate_challenge_token
    class RotateChallengeTokenResponse < Cadenya::Internal::Type::BaseModel
      # @!attribute challenge_token
      #
      #   @return [String, nil]
      optional :challenge_token, String, api_name: :challengeToken

      # @!method initialize(challenge_token: nil)
      #   Response containing the newly generated challenge token.
      #
      #   @param challenge_token [String]
    end
  end
end
