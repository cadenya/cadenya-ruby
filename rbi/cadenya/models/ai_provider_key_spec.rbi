# typed: strong

module Cadenya
  module Models
    class AIProviderKeySpec < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::AIProviderKeySpec, Cadenya::Internal::AnyHash)
        end

      # The provider credential. Accepted on create/update; never populated in responses
      # (the server returns an empty value to avoid leaking it).
      sig { returns(T.nilable(String)) }
      attr_reader :api_key

      sig { params(api_key: String).void }
      attr_writer :api_key

      # The AI provider this key authenticates against. Currently "openrouter".
      sig { returns(T.nilable(String)) }
      attr_reader :provider

      sig { params(provider: String).void }
      attr_writer :provider

      # The provider region. "us" or "eu". Defaults to "us".
      sig { returns(T.nilable(String)) }
      attr_reader :region

      sig { params(region: String).void }
      attr_writer :region

      sig do
        params(api_key: String, provider: String, region: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # The provider credential. Accepted on create/update; never populated in responses
        # (the server returns an empty value to avoid leaking it).
        api_key: nil,
        # The AI provider this key authenticates against. Currently "openrouter".
        provider: nil,
        # The provider region. "us" or "eu". Defaults to "us".
        region: nil
      )
      end

      sig do
        override.returns({ api_key: String, provider: String, region: String })
      end
      def to_hash
      end
    end
  end
end
