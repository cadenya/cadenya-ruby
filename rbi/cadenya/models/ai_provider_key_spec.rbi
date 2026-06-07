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

      # OpenRouterConfig holds OpenRouter-specific settings. Empty for now; it exists as
      # the oneof seam so provider-specific options (region, base URL, etc.) can be
      # added later without restructuring the spec.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :openrouter

      sig { params(openrouter: T.anything).void }
      attr_writer :openrouter

      # The AI provider this key authenticates against.
      sig { returns(T.nilable(Cadenya::AIProviderKeySpec::Provider::OrSymbol)) }
      attr_reader :provider

      sig do
        params(provider: Cadenya::AIProviderKeySpec::Provider::OrSymbol).void
      end
      attr_writer :provider

      sig do
        params(
          api_key: String,
          openrouter: T.anything,
          provider: Cadenya::AIProviderKeySpec::Provider::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The provider credential. Accepted on create/update; never populated in responses
        # (the server returns an empty value to avoid leaking it).
        api_key: nil,
        # OpenRouterConfig holds OpenRouter-specific settings. Empty for now; it exists as
        # the oneof seam so provider-specific options (region, base URL, etc.) can be
        # added later without restructuring the spec.
        openrouter: nil,
        # The AI provider this key authenticates against.
        provider: nil
      )
      end

      sig do
        override.returns(
          {
            api_key: String,
            openrouter: T.anything,
            provider: Cadenya::AIProviderKeySpec::Provider::OrSymbol
          }
        )
      end
      def to_hash
      end

      # The AI provider this key authenticates against.
      module Provider
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::AIProviderKeySpec::Provider) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AI_PROVIDER_UNSPECIFIED =
          T.let(
            :AI_PROVIDER_UNSPECIFIED,
            Cadenya::AIProviderKeySpec::Provider::TaggedSymbol
          )
        AI_PROVIDER_OPENROUTER =
          T.let(
            :AI_PROVIDER_OPENROUTER,
            Cadenya::AIProviderKeySpec::Provider::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::AIProviderKeySpec::Provider::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
