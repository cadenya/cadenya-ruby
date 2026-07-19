# typed: strong

module Cadenya
  module Models
    class AIProviderConfigOpenrouter < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::AIProviderConfigOpenrouter, Cadenya::Internal::AnyHash)
        end

      # OpenRouterConfig holds OpenRouter-specific settings.
      sig { returns(Cadenya::AIProviderConfigOpenrouter::Openrouter) }
      attr_reader :openrouter

      sig do
        params(
          openrouter: Cadenya::AIProviderConfigOpenrouter::Openrouter::OrHash
        ).void
      end
      attr_writer :openrouter

      sig { returns(Cadenya::AIProviderConfigOpenrouter::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          openrouter: Cadenya::AIProviderConfigOpenrouter::Openrouter::OrHash,
          type: Cadenya::AIProviderConfigOpenrouter::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # OpenRouterConfig holds OpenRouter-specific settings.
        openrouter:,
        type:
      )
      end

      sig do
        override.returns(
          {
            openrouter: Cadenya::AIProviderConfigOpenrouter::Openrouter,
            type: Cadenya::AIProviderConfigOpenrouter::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      class Openrouter < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::AIProviderConfigOpenrouter::Openrouter,
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

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::AIProviderConfigOpenrouter::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPENROUTER =
          T.let(
            :openrouter,
            Cadenya::AIProviderConfigOpenrouter::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::AIProviderConfigOpenrouter::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
