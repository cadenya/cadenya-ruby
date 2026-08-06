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
      sig { returns(T.nilable(Cadenya::AIProviderKeySpec::Config)) }
      attr_reader :config

      sig { params(config: Cadenya::AIProviderKeySpec::Config::OrHash).void }
      attr_writer :config

      # AIProviderCredential is the secret material used to authenticate with a
      # provider. The set case must correspond to AIProviderKeySpec.provider. The server
      # encrypts the serialized message at rest and never returns it on reads.
      sig { returns(T.nilable(Cadenya::AIProviderKeySpec::Credentials)) }
      attr_reader :credentials

      sig do
        params(
          credentials: Cadenya::AIProviderKeySpec::Credentials::OrHash
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
          config: Cadenya::AIProviderKeySpec::Config::OrHash,
          credentials: Cadenya::AIProviderKeySpec::Credentials::OrHash,
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
            config: Cadenya::AIProviderKeySpec::Config,
            credentials: Cadenya::AIProviderKeySpec::Credentials,
            provider: Cadenya::AIProviderKeySpec::Provider::OrSymbol
          }
        )
      end
      def to_hash
      end

      class Config < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::AIProviderKeySpec::Config,
              Cadenya::Internal::AnyHash
            )
          end

        # OpenAIConfig holds OpenAI-specific settings.
        sig { returns(T.nilable(Cadenya::AIProviderKeySpec::Config::OpenAI)) }
        attr_reader :openai

        sig do
          params(
            openai: Cadenya::AIProviderKeySpec::Config::OpenAI::OrHash
          ).void
        end
        attr_writer :openai

        # OpenAICompatibleConfig configures a generic endpoint that speaks the OpenAI Chat
        # Completions API. The base URL is required and its model catalog is discovered
        # live via GET {base_url}/models.
        sig do
          returns(
            T.nilable(Cadenya::AIProviderKeySpec::Config::OpenAICompatible)
          )
        end
        attr_reader :openai_compatible

        sig do
          params(
            openai_compatible:
              Cadenya::AIProviderKeySpec::Config::OpenAICompatible::OrHash
          ).void
        end
        attr_writer :openai_compatible

        # OpenRouterConfig holds OpenRouter-specific settings.
        sig do
          returns(T.nilable(Cadenya::AIProviderKeySpec::Config::Openrouter))
        end
        attr_reader :openrouter

        sig do
          params(
            openrouter: Cadenya::AIProviderKeySpec::Config::Openrouter::OrHash
          ).void
        end
        attr_writer :openrouter

        # The JSON name of the variant set in `config` (e.g. "openrouter"). Required from
        # clients on writes, filled by the server on reads; drives the discriminated union
        # in the generated OpenAPI.
        sig { returns(T.nilable(String)) }
        attr_reader :type

        sig { params(type: String).void }
        attr_writer :type

        # AIProviderConfig holds non-secret, provider-specific settings. The set case must
        # correspond to AIProviderKeySpec.provider. Providers with no settings (Anthropic,
        # Gemini) simply leave this unset. The endpoint of a named provider is fixed and
        # intentionally not overridable here; use the OpenAI-compatible provider to target
        # a custom endpoint.
        sig do
          params(
            openai: Cadenya::AIProviderKeySpec::Config::OpenAI::OrHash,
            openai_compatible:
              Cadenya::AIProviderKeySpec::Config::OpenAICompatible::OrHash,
            openrouter: Cadenya::AIProviderKeySpec::Config::Openrouter::OrHash,
            type: String
          ).returns(T.attached_class)
        end
        def self.new(
          # OpenAIConfig holds OpenAI-specific settings.
          openai: nil,
          # OpenAICompatibleConfig configures a generic endpoint that speaks the OpenAI Chat
          # Completions API. The base URL is required and its model catalog is discovered
          # live via GET {base_url}/models.
          openai_compatible: nil,
          # OpenRouterConfig holds OpenRouter-specific settings.
          openrouter: nil,
          # The JSON name of the variant set in `config` (e.g. "openrouter"). Required from
          # clients on writes, filled by the server on reads; drives the discriminated union
          # in the generated OpenAPI.
          type: nil
        )
        end

        sig do
          override.returns(
            {
              openai: Cadenya::AIProviderKeySpec::Config::OpenAI,
              openai_compatible:
                Cadenya::AIProviderKeySpec::Config::OpenAICompatible,
              openrouter: Cadenya::AIProviderKeySpec::Config::Openrouter,
              type: String
            }
          )
        end
        def to_hash
        end

        class OpenAI < Cadenya::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Cadenya::AIProviderKeySpec::Config::OpenAI,
                Cadenya::Internal::AnyHash
              )
            end

          # Sent as the OpenAI-Organization header when set.
          sig { returns(T.nilable(String)) }
          attr_reader :organization_id

          sig { params(organization_id: String).void }
          attr_writer :organization_id

          # Sent as the OpenAI-Project header when set.
          sig { returns(T.nilable(String)) }
          attr_reader :project_id

          sig { params(project_id: String).void }
          attr_writer :project_id

          # OpenAIConfig holds OpenAI-specific settings.
          sig do
            params(organization_id: String, project_id: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # Sent as the OpenAI-Organization header when set.
            organization_id: nil,
            # Sent as the OpenAI-Project header when set.
            project_id: nil
          )
          end

          sig do
            override.returns({ organization_id: String, project_id: String })
          end
          def to_hash
          end
        end

        class OpenAICompatible < Cadenya::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Cadenya::AIProviderKeySpec::Config::OpenAICompatible,
                Cadenya::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :base_url

          # OpenAICompatibleConfig configures a generic endpoint that speaks the OpenAI Chat
          # Completions API. The base URL is required and its model catalog is discovered
          # live via GET {base_url}/models.
          sig { params(base_url: String).returns(T.attached_class) }
          def self.new(base_url:)
          end

          sig { override.returns({ base_url: String }) }
          def to_hash
          end
        end

        class Openrouter < Cadenya::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Cadenya::AIProviderKeySpec::Config::Openrouter,
                Cadenya::Internal::AnyHash
              )
            end

          # Data-residency region (e.g. "us", "eu"). Empty uses the provider default.
          sig { returns(T.nilable(String)) }
          attr_reader :region

          sig { params(region: String).void }
          attr_writer :region

          # OpenRouterConfig holds OpenRouter-specific settings.
          sig { params(region: String).returns(T.attached_class) }
          def self.new(
            # Data-residency region (e.g. "us", "eu"). Empty uses the provider default.
            region: nil
          )
          end

          sig { override.returns({ region: String }) }
          def to_hash
          end
        end
      end

      class Credentials < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::AIProviderKeySpec::Credentials,
              Cadenya::Internal::AnyHash
            )
          end

        # CredentialAPIKey carries a single bearer/header API key.
        sig do
          returns(T.nilable(Cadenya::AIProviderKeySpec::Credentials::APIKey))
        end
        attr_reader :api_key

        sig do
          params(
            api_key: Cadenya::AIProviderKeySpec::Credentials::APIKey::OrHash
          ).void
        end
        attr_writer :api_key

        # CredentialHeaders carries arbitrary HTTP headers sent with every request to the
        # provider (e.g. {"Authorization": "Bearer ...", "X-Api-Key": "..."}).
        sig do
          returns(T.nilable(Cadenya::AIProviderKeySpec::Credentials::Headers))
        end
        attr_reader :headers

        sig do
          params(
            headers: Cadenya::AIProviderKeySpec::Credentials::Headers::OrHash
          ).void
        end
        attr_writer :headers

        # The JSON name of the variant set in `credential` (e.g. "apiKey"). Required on
        # input; never returned (the credential is write-only). Drives the discriminated
        # union in the generated OpenAPI.
        sig { returns(T.nilable(String)) }
        attr_reader :type

        sig { params(type: String).void }
        attr_writer :type

        # AIProviderCredential is the secret material used to authenticate with a
        # provider. The set case must correspond to AIProviderKeySpec.provider. The server
        # encrypts the serialized message at rest and never returns it on reads.
        sig do
          params(
            api_key: Cadenya::AIProviderKeySpec::Credentials::APIKey::OrHash,
            headers: Cadenya::AIProviderKeySpec::Credentials::Headers::OrHash,
            type: String
          ).returns(T.attached_class)
        end
        def self.new(
          # CredentialAPIKey carries a single bearer/header API key.
          api_key: nil,
          # CredentialHeaders carries arbitrary HTTP headers sent with every request to the
          # provider (e.g. {"Authorization": "Bearer ...", "X-Api-Key": "..."}).
          headers: nil,
          # The JSON name of the variant set in `credential` (e.g. "apiKey"). Required on
          # input; never returned (the credential is write-only). Drives the discriminated
          # union in the generated OpenAPI.
          type: nil
        )
        end

        sig do
          override.returns(
            {
              api_key: Cadenya::AIProviderKeySpec::Credentials::APIKey,
              headers: Cadenya::AIProviderKeySpec::Credentials::Headers,
              type: String
            }
          )
        end
        def to_hash
        end

        class APIKey < Cadenya::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Cadenya::AIProviderKeySpec::Credentials::APIKey,
                Cadenya::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :api_key

          sig { params(api_key: String).void }
          attr_writer :api_key

          # CredentialAPIKey carries a single bearer/header API key.
          sig { params(api_key: String).returns(T.attached_class) }
          def self.new(api_key: nil)
          end

          sig { override.returns({ api_key: String }) }
          def to_hash
          end
        end

        class Headers < Cadenya::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Cadenya::AIProviderKeySpec::Credentials::Headers,
                Cadenya::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :headers

          sig { params(headers: T::Hash[Symbol, String]).void }
          attr_writer :headers

          # CredentialHeaders carries arbitrary HTTP headers sent with every request to the
          # provider (e.g. {"Authorization": "Bearer ...", "X-Api-Key": "..."}).
          sig do
            params(headers: T::Hash[Symbol, String]).returns(T.attached_class)
          end
          def self.new(headers: nil)
          end

          sig { override.returns({ headers: T::Hash[Symbol, String] }) }
          def to_hash
          end
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
