# typed: strong

module Cadenya
  module Models
    class RotateChallengeTokenResponse < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::RotateChallengeTokenResponse,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :challenge_token

      sig { params(challenge_token: String).void }
      attr_writer :challenge_token

      # Response containing the newly generated challenge token.
      sig { params(challenge_token: String).returns(T.attached_class) }
      def self.new(challenge_token: nil)
      end

      sig { override.returns({ challenge_token: String }) }
      def to_hash
      end
    end
  end
end
