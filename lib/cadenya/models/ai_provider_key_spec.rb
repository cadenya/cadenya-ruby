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
      #   @return [Cadenya::Models::AIProviderKeySpec::Config, nil]
      optional :config, -> { Cadenya::AIProviderKeySpec::Config }

      # @!attribute credentials
      #   AIProviderCredential is the secret material used to authenticate with a
      #   provider. The set case must correspond to AIProviderKeySpec.provider. The server
      #   encrypts the serialized message at rest and never returns it on reads.
      #
      #   @return [Cadenya::Models::AIProviderKeySpec::Credentials, nil]
      optional :credentials, -> { Cadenya::AIProviderKeySpec::Credentials }

      # @!attribute provider
      #   The AI provider this key authenticates against.
      #
      #   @return [Symbol, Cadenya::Models::AIProviderKeySpec::Provider, nil]
      optional :provider, enum: -> { Cadenya::AIProviderKeySpec::Provider }

      # @!method initialize(config: nil, credentials: nil, provider: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AIProviderKeySpec} for more details.
      #
      #   @param config [Cadenya::Models::AIProviderKeySpec::Config] AIProviderConfig holds non-secret, provider-specific settings. The set case
      #
      #   @param credentials [Cadenya::Models::AIProviderKeySpec::Credentials] AIProviderCredential is the secret material used to authenticate with a
      #
      #   @param provider [Symbol, Cadenya::Models::AIProviderKeySpec::Provider] The AI provider this key authenticates against.

      # @see Cadenya::Models::AIProviderKeySpec#config
      class Config < Cadenya::Internal::Type::BaseModel
        # @!attribute openai
        #   OpenAIConfig holds OpenAI-specific settings.
        #
        #   @return [Cadenya::Models::AIProviderKeySpec::Config::OpenAI, nil]
        optional :openai, -> { Cadenya::AIProviderKeySpec::Config::OpenAI }

        # @!attribute openai_compatible
        #   OpenAICompatibleConfig configures a generic endpoint that speaks the OpenAI Chat
        #   Completions API. The base URL is required and its model catalog is discovered
        #   live via GET {base_url}/models.
        #
        #   @return [Cadenya::Models::AIProviderKeySpec::Config::OpenAICompatible, nil]
        optional :openai_compatible,
                 -> { Cadenya::AIProviderKeySpec::Config::OpenAICompatible },
                 api_name: :openaiCompatible

        # @!attribute openrouter
        #   OpenRouterConfig holds OpenRouter-specific settings.
        #
        #   @return [Cadenya::Models::AIProviderKeySpec::Config::Openrouter, nil]
        optional :openrouter, -> { Cadenya::AIProviderKeySpec::Config::Openrouter }

        # @!method initialize(openai: nil, openai_compatible: nil, openrouter: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::AIProviderKeySpec::Config} for more details.
        #
        #   AIProviderConfig holds non-secret, provider-specific settings. The set case must
        #   correspond to AIProviderKeySpec.provider. Providers with no settings (Anthropic,
        #   Gemini) simply leave this unset. The endpoint of a named provider is fixed and
        #   intentionally not overridable here; use the OpenAI-compatible provider to target
        #   a custom endpoint.
        #
        #   @param openai [Cadenya::Models::AIProviderKeySpec::Config::OpenAI] OpenAIConfig holds OpenAI-specific settings.
        #
        #   @param openai_compatible [Cadenya::Models::AIProviderKeySpec::Config::OpenAICompatible] OpenAICompatibleConfig configures a generic endpoint that speaks the OpenAI
        #
        #   @param openrouter [Cadenya::Models::AIProviderKeySpec::Config::Openrouter] OpenRouterConfig holds OpenRouter-specific settings.

        # @see Cadenya::Models::AIProviderKeySpec::Config#openai
        class OpenAI < Cadenya::Internal::Type::BaseModel
          # @!attribute organization_id
          #   Sent as the OpenAI-Organization header when set.
          #
          #   @return [String, nil]
          optional :organization_id, String, api_name: :organizationId

          # @!attribute project_id
          #   Sent as the OpenAI-Project header when set.
          #
          #   @return [String, nil]
          optional :project_id, String, api_name: :projectId

          # @!method initialize(organization_id: nil, project_id: nil)
          #   OpenAIConfig holds OpenAI-specific settings.
          #
          #   @param organization_id [String] Sent as the OpenAI-Organization header when set.
          #
          #   @param project_id [String] Sent as the OpenAI-Project header when set.
        end

        # @see Cadenya::Models::AIProviderKeySpec::Config#openai_compatible
        class OpenAICompatible < Cadenya::Internal::Type::BaseModel
          # @!attribute base_url
          #
          #   @return [String, nil]
          optional :base_url, String, api_name: :baseUrl

          # @!method initialize(base_url: nil)
          #   OpenAICompatibleConfig configures a generic endpoint that speaks the OpenAI Chat
          #   Completions API. The base URL is required and its model catalog is discovered
          #   live via GET {base_url}/models.
          #
          #   @param base_url [String]
        end

        # @see Cadenya::Models::AIProviderKeySpec::Config#openrouter
        class Openrouter < Cadenya::Internal::Type::BaseModel
          # @!attribute region
          #   Data-residency region (e.g. "us", "eu"). Empty uses the provider default.
          #
          #   @return [String, nil]
          optional :region, String

          # @!method initialize(region: nil)
          #   OpenRouterConfig holds OpenRouter-specific settings.
          #
          #   @param region [String] Data-residency region (e.g. "us", "eu"). Empty uses the provider default.
        end
      end

      # @see Cadenya::Models::AIProviderKeySpec#credentials
      class Credentials < Cadenya::Internal::Type::BaseModel
        # @!attribute api_key
        #   CredentialAPIKey carries a single bearer/header API key.
        #
        #   @return [Cadenya::Models::AIProviderKeySpec::Credentials::APIKey, nil]
        optional :api_key, -> { Cadenya::AIProviderKeySpec::Credentials::APIKey }, api_name: :apiKey

        # @!attribute headers
        #   CredentialHeaders carries arbitrary HTTP headers sent with every request to the
        #   provider (e.g. {"Authorization": "Bearer ...", "X-Api-Key": "..."}).
        #
        #   @return [Cadenya::Models::AIProviderKeySpec::Credentials::Headers, nil]
        optional :headers, -> { Cadenya::AIProviderKeySpec::Credentials::Headers }

        # @!method initialize(api_key: nil, headers: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::AIProviderKeySpec::Credentials} for more details.
        #
        #   AIProviderCredential is the secret material used to authenticate with a
        #   provider. The set case must correspond to AIProviderKeySpec.provider. The server
        #   encrypts the serialized message at rest and never returns it on reads.
        #
        #   @param api_key [Cadenya::Models::AIProviderKeySpec::Credentials::APIKey] CredentialAPIKey carries a single bearer/header API key.
        #
        #   @param headers [Cadenya::Models::AIProviderKeySpec::Credentials::Headers] CredentialHeaders carries arbitrary HTTP headers sent with every request to

        # @see Cadenya::Models::AIProviderKeySpec::Credentials#api_key
        class APIKey < Cadenya::Internal::Type::BaseModel
          # @!attribute api_key
          #
          #   @return [String, nil]
          optional :api_key, String, api_name: :apiKey

          # @!method initialize(api_key: nil)
          #   CredentialAPIKey carries a single bearer/header API key.
          #
          #   @param api_key [String]
        end

        # @see Cadenya::Models::AIProviderKeySpec::Credentials#headers
        class Headers < Cadenya::Internal::Type::BaseModel
          # @!attribute headers
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :headers, Cadenya::Internal::Type::HashOf[String]

          # @!method initialize(headers: nil)
          #   CredentialHeaders carries arbitrary HTTP headers sent with every request to the
          #   provider (e.g. {"Authorization": "Bearer ...", "X-Api-Key": "..."}).
          #
          #   @param headers [Hash{Symbol=>String}]
        end
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
