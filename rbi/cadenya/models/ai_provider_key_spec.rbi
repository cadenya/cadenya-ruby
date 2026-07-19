# typed: strong

module Cadenya
  module Models
    class AIProviderKeySpec < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::AIProviderKeySpec, Cadenya::Internal::AnyHash)
        end

      # AIProviderConfig holds non-secret, provider-specific settings. The set case must
      # correspond to AIProviderKeySpec.provider. Providers with no settings (Anthropic,
      # Gemini) simply leave this unset. The endpoint of a named provider is fixed and
      # intentionally not overridable here; use the OpenAI-compatible provider to target
      # a custom endpoint.
      sig do
        returns(
          T.nilable(
            T.any(
              Cadenya::AIProviderConfigOpenrouter,
              Cadenya::AIProviderConfigOpenAI,
              Cadenya::AIProviderConfigOpenAICompatible
            )
          )
        )
      end
      attr_reader :config

      sig do
        params(
          config:
            T.any(
              Cadenya::AIProviderConfigOpenrouter::OrHash,
              Cadenya::AIProviderConfigOpenAI::OrHash,
              Cadenya::AIProviderConfigOpenAICompatible::OrHash
            )
        ).void
      end
      attr_writer :config

      # AIProviderCredential is the secret material used to authenticate with a
      # provider. The set case must correspond to AIProviderKeySpec.provider. The server
      # encrypts the serialized message at rest and never returns it on reads.
      sig do
        returns(
          T.nilable(
            T.any(
              Cadenya::AIProviderCredentialAPIKey,
              Cadenya::AIProviderCredentialHeaders
            )
          )
        )
      end
      attr_reader :credentials

      sig do
        params(
          credentials:
            T.any(
              Cadenya::AIProviderCredentialAPIKey::OrHash,
              Cadenya::AIProviderCredentialHeaders::OrHash
            )
        ).void
      end
      attr_writer :credentials

      # The AI provider this key authenticates against.
      sig { returns(T.nilable(Cadenya::AIProviderKeySpec::Provider::OrSymbol)) }
      attr_reader :provider

      sig do
        params(provider: Cadenya::AIProviderKeySpec::Provider::OrSymbol).void
      end
      attr_writer :provider

      sig do
        params(
          config:
            T.any(
              Cadenya::AIProviderConfigOpenrouter::OrHash,
              Cadenya::AIProviderConfigOpenAI::OrHash,
              Cadenya::AIProviderConfigOpenAICompatible::OrHash
            ),
          credentials:
            T.any(
              Cadenya::AIProviderCredentialAPIKey::OrHash,
              Cadenya::AIProviderCredentialHeaders::OrHash
            ),
          provider: Cadenya::AIProviderKeySpec::Provider::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # AIProviderConfig holds non-secret, provider-specific settings. The set case must
        # correspond to AIProviderKeySpec.provider. Providers with no settings (Anthropic,
        # Gemini) simply leave this unset. The endpoint of a named provider is fixed and
        # intentionally not overridable here; use the OpenAI-compatible provider to target
        # a custom endpoint.
        config: nil,
        # AIProviderCredential is the secret material used to authenticate with a
        # provider. The set case must correspond to AIProviderKeySpec.provider. The server
        # encrypts the serialized message at rest and never returns it on reads.
        credentials: nil,
        # The AI provider this key authenticates against.
        provider: nil
      )
      end

      sig do
        override.returns(
          {
            config:
              T.any(
                Cadenya::AIProviderConfigOpenrouter,
                Cadenya::AIProviderConfigOpenAI,
                Cadenya::AIProviderConfigOpenAICompatible
              ),
            credentials:
              T.any(
                Cadenya::AIProviderCredentialAPIKey,
                Cadenya::AIProviderCredentialHeaders
              ),
            provider: Cadenya::AIProviderKeySpec::Provider::OrSymbol
          }
        )
      end
      def to_hash
      end

      # AIProviderConfig holds non-secret, provider-specific settings. The set case must
      # correspond to AIProviderKeySpec.provider. Providers with no settings (Anthropic,
      # Gemini) simply leave this unset. The endpoint of a named provider is fixed and
      # intentionally not overridable here; use the OpenAI-compatible provider to target
      # a custom endpoint.
      module Config
        extend Cadenya::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Cadenya::AIProviderConfigOpenrouter,
              Cadenya::AIProviderConfigOpenAI,
              Cadenya::AIProviderConfigOpenAICompatible
            )
          end

        sig do
          override.returns(
            T::Array[Cadenya::AIProviderKeySpec::Config::Variants]
          )
        end
        def self.variants
        end
      end

      # AIProviderCredential is the secret material used to authenticate with a
      # provider. The set case must correspond to AIProviderKeySpec.provider. The server
      # encrypts the serialized message at rest and never returns it on reads.
      module Credentials
        extend Cadenya::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Cadenya::AIProviderCredentialAPIKey,
              Cadenya::AIProviderCredentialHeaders
            )
          end

        sig do
          override.returns(
            T::Array[Cadenya::AIProviderKeySpec::Credentials::Variants]
          )
        end
        def self.variants
        end
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
        AI_PROVIDER_OPENAI =
          T.let(
            :AI_PROVIDER_OPENAI,
            Cadenya::AIProviderKeySpec::Provider::TaggedSymbol
          )
        AI_PROVIDER_ANTHROPIC =
          T.let(
            :AI_PROVIDER_ANTHROPIC,
            Cadenya::AIProviderKeySpec::Provider::TaggedSymbol
          )
        AI_PROVIDER_GEMINI =
          T.let(
            :AI_PROVIDER_GEMINI,
            Cadenya::AIProviderKeySpec::Provider::TaggedSymbol
          )
        AI_PROVIDER_OPENAI_COMPATIBLE =
          T.let(
            :AI_PROVIDER_OPENAI_COMPATIBLE,
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
