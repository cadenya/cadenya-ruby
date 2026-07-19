# typed: strong

module Cadenya
  module Models
    class AIProviderConfigOpenAICompatible < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::AIProviderConfigOpenAICompatible,
            Cadenya::Internal::AnyHash
          )
        end

      # OpenAICompatibleConfig configures a generic endpoint that speaks the OpenAI Chat
      # Completions API. The base URL is required and its model catalog is discovered
      # live via GET {base_url}/models.
      sig do
        returns(Cadenya::AIProviderConfigOpenAICompatible::OpenAICompatible)
      end
      attr_reader :openai_compatible

      sig do
        params(
          openai_compatible:
            Cadenya::AIProviderConfigOpenAICompatible::OpenAICompatible::OrHash
        ).void
      end
      attr_writer :openai_compatible

      sig { returns(Cadenya::AIProviderConfigOpenAICompatible::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          openai_compatible:
            Cadenya::AIProviderConfigOpenAICompatible::OpenAICompatible::OrHash,
          type: Cadenya::AIProviderConfigOpenAICompatible::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # OpenAICompatibleConfig configures a generic endpoint that speaks the OpenAI Chat
        # Completions API. The base URL is required and its model catalog is discovered
        # live via GET {base_url}/models.
        openai_compatible:,
        type:
      )
      end

      sig do
        override.returns(
          {
            openai_compatible:
              Cadenya::AIProviderConfigOpenAICompatible::OpenAICompatible,
            type: Cadenya::AIProviderConfigOpenAICompatible::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      class OpenAICompatible < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::AIProviderConfigOpenAICompatible::OpenAICompatible,
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

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::AIProviderConfigOpenAICompatible::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPENAI_COMPATIBLE =
          T.let(
            :openaiCompatible,
            Cadenya::AIProviderConfigOpenAICompatible::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Cadenya::AIProviderConfigOpenAICompatible::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
