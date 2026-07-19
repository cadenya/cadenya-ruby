# frozen_string_literal: true

module Cadenya
  module Models
    class AIProviderKeySpec < Cadenya::Internal::Type::BaseModel
      # @!attribute config
      #   AIProviderConfig holds non-secret, provider-specific settings. The set case must
      #   correspond to AIProviderKeySpec.provider. Providers with no settings (Anthropic,
      #   Gemini) simply leave this unset. The endpoint of a named provider is fixed and
      #   intentionally not overridable here; use the OpenAI-compatible provider to target
      #   a custom endpoint.
      #
      #   @return [Cadenya::Models::AIProviderConfigOpenrouter, Cadenya::Models::AIProviderConfigOpenAI, Cadenya::Models::AIProviderConfigOpenAICompatible, nil]
      optional :config, union: -> { Cadenya::AIProviderKeySpec::Config }

      # @!attribute credentials
      #   AIProviderCredential is the secret material used to authenticate with a
      #   provider. The set case must correspond to AIProviderKeySpec.provider. The server
      #   encrypts the serialized message at rest and never returns it on reads.
      #
      #   @return [Cadenya::Models::AIProviderCredentialAPIKey, Cadenya::Models::AIProviderCredentialHeaders, nil]
      optional :credentials, union: -> { Cadenya::AIProviderKeySpec::Credentials }

      # @!attribute provider
      #   The AI provider this key authenticates against.
      #
      #   @return [Symbol, Cadenya::Models::AIProviderKeySpec::Provider, nil]
      optional :provider, enum: -> { Cadenya::AIProviderKeySpec::Provider }

      # @!method initialize(config: nil, credentials: nil, provider: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AIProviderKeySpec} for more details.
      #
      #   @param config [Cadenya::Models::AIProviderConfigOpenrouter, Cadenya::Models::AIProviderConfigOpenAI, Cadenya::Models::AIProviderConfigOpenAICompatible] AIProviderConfig holds non-secret, provider-specific settings. The set case
      #
      #   @param credentials [Cadenya::Models::AIProviderCredentialAPIKey, Cadenya::Models::AIProviderCredentialHeaders] AIProviderCredential is the secret material used to authenticate with a
      #
      #   @param provider [Symbol, Cadenya::Models::AIProviderKeySpec::Provider] The AI provider this key authenticates against.

      # AIProviderConfig holds non-secret, provider-specific settings. The set case must
      # correspond to AIProviderKeySpec.provider. Providers with no settings (Anthropic,
      # Gemini) simply leave this unset. The endpoint of a named provider is fixed and
      # intentionally not overridable here; use the OpenAI-compatible provider to target
      # a custom endpoint.
      #
      # @see Cadenya::Models::AIProviderKeySpec#config
      module Config
        extend Cadenya::Internal::Type::Union

        discriminator :type

        variant :openrouter, -> { Cadenya::AIProviderConfigOpenrouter }

        variant :openai, -> { Cadenya::AIProviderConfigOpenAI }

        variant :openaiCompatible, -> { Cadenya::AIProviderConfigOpenAICompatible }

        # @!method self.variants
        #   @return [Array(Cadenya::Models::AIProviderConfigOpenrouter, Cadenya::Models::AIProviderConfigOpenAI, Cadenya::Models::AIProviderConfigOpenAICompatible)]
      end

      # AIProviderCredential is the secret material used to authenticate with a
      # provider. The set case must correspond to AIProviderKeySpec.provider. The server
      # encrypts the serialized message at rest and never returns it on reads.
      #
      # @see Cadenya::Models::AIProviderKeySpec#credentials
      module Credentials
        extend Cadenya::Internal::Type::Union

        discriminator :type

        variant :apiKey, -> { Cadenya::AIProviderCredentialAPIKey }

        variant :headers, -> { Cadenya::AIProviderCredentialHeaders }

        # @!method self.variants
        #   @return [Array(Cadenya::Models::AIProviderCredentialAPIKey, Cadenya::Models::AIProviderCredentialHeaders)]
      end

      # The AI provider this key authenticates against.
      #
      # @see Cadenya::Models::AIProviderKeySpec#provider
      module Provider
        extend Cadenya::Internal::Type::Enum

        AI_PROVIDER_UNSPECIFIED = :AI_PROVIDER_UNSPECIFIED
        AI_PROVIDER_OPENROUTER = :AI_PROVIDER_OPENROUTER
        AI_PROVIDER_OPENAI = :AI_PROVIDER_OPENAI
        AI_PROVIDER_ANTHROPIC = :AI_PROVIDER_ANTHROPIC
        AI_PROVIDER_GEMINI = :AI_PROVIDER_GEMINI
        AI_PROVIDER_OPENAI_COMPATIBLE = :AI_PROVIDER_OPENAI_COMPATIBLE

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
