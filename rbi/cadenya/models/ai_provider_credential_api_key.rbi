# typed: strong

module Cadenya
  module Models
    class AIProviderCredentialAPIKey < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::AIProviderCredentialAPIKey, Cadenya::Internal::AnyHash)
        end

      # CredentialAPIKey carries a single bearer/header API key.
      sig { returns(Cadenya::AIProviderCredentialAPIKey::APIKey) }
      attr_reader :api_key

      sig do
        params(
          api_key: Cadenya::AIProviderCredentialAPIKey::APIKey::OrHash
        ).void
      end
      attr_writer :api_key

      sig { returns(Cadenya::AIProviderCredentialAPIKey::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          api_key: Cadenya::AIProviderCredentialAPIKey::APIKey::OrHash,
          type: Cadenya::AIProviderCredentialAPIKey::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # CredentialAPIKey carries a single bearer/header API key.
        api_key:,
        type:
      )
      end

      sig do
        override.returns(
          {
            api_key: Cadenya::AIProviderCredentialAPIKey::APIKey,
            type: Cadenya::AIProviderCredentialAPIKey::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      class APIKey < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::AIProviderCredentialAPIKey::APIKey,
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

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::AIProviderCredentialAPIKey::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        API_KEY =
          T.let(
            :apiKey,
            Cadenya::AIProviderCredentialAPIKey::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::AIProviderCredentialAPIKey::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
