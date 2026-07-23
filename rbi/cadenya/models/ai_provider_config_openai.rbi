# typed: strong

module Cadenya
  module Models
    class AIProviderConfigOpenAI < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::AIProviderConfigOpenAI, Cadenya::Internal::AnyHash)
        end

      # OpenAIConfig holds OpenAI-specific settings.
      sig { returns(Cadenya::AIProviderConfigOpenAI::OpenAI) }
      attr_reader :openai

      sig do
        params(openai: Cadenya::AIProviderConfigOpenAI::OpenAI::OrHash).void
      end
      attr_writer :openai

      sig { returns(Cadenya::AIProviderConfigOpenAI::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          openai: Cadenya::AIProviderConfigOpenAI::OpenAI::OrHash,
          type: Cadenya::AIProviderConfigOpenAI::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # OpenAIConfig holds OpenAI-specific settings.
        openai:,
        type:
      )
      end

      sig do
        override.returns(
          {
            openai: Cadenya::AIProviderConfigOpenAI::OpenAI,
            type: Cadenya::AIProviderConfigOpenAI::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      class OpenAI < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::AIProviderConfigOpenAI::OpenAI,
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

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::AIProviderConfigOpenAI::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPENAI =
          T.let(:openai, Cadenya::AIProviderConfigOpenAI::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::AIProviderConfigOpenAI::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
