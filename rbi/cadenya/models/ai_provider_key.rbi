# typed: strong

module Cadenya
  module Models
    class AIProviderKey < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::AIProviderKey, Cadenya::Internal::AnyHash)
        end

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :metadata

      sig { returns(Cadenya::AIProviderKeySpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::AIProviderKeySpec::OrHash).void }
      attr_writer :spec

      # AIProviderKeyInfo carries server-derived, read-only details about a key, for AI
      # provider management UIs.
      sig { returns(T.nilable(Cadenya::AIProviderKey::Info)) }
      attr_reader :info

      sig { params(info: Cadenya::AIProviderKey::Info::OrHash).void }
      attr_writer :info

      # AIProviderKey is a credential for an AI provider, scoped to a workspace. Most
      # keys are customer-provided (BYOK); Cadenya also provisions promotional keys (see
      # AIProviderKeyInfo.is_promotional), which cannot be modified or deleted by
      # account administrators. The secret value is never returned in responses.
      sig do
        params(
          metadata: Cadenya::ResourceMetadata::OrHash,
          spec: Cadenya::AIProviderKeySpec::OrHash,
          info: Cadenya::AIProviderKey::Info::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        metadata:,
        spec:,
        # AIProviderKeyInfo carries server-derived, read-only details about a key, for AI
        # provider management UIs.
        info: nil
      )
      end

      sig do
        override.returns(
          {
            metadata: Cadenya::ResourceMetadata,
            spec: Cadenya::AIProviderKeySpec,
            info: Cadenya::AIProviderKey::Info
          }
        )
      end
      def to_hash
      end

      class Info < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::AIProviderKey::Info, Cadenya::Internal::AnyHash)
          end

        # Number of disabled models provisioned on this key.
        sig { returns(T.nilable(Integer)) }
        attr_reader :disabled_model_count

        sig { params(disabled_model_count: Integer).void }
        attr_writer :disabled_model_count

        # Number of enabled models provisioned on this key.
        sig { returns(T.nilable(Integer)) }
        attr_reader :enabled_model_count

        sig { params(enabled_model_count: Integer).void }
        attr_writer :enabled_model_count

        # Cadenya includes promotional keys (one for onboarding, and potentially more in
        # the future). These are not added or maintained by account administrators.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_promotional

        sig { params(is_promotional: T::Boolean).void }
        attr_writer :is_promotional

        # AIProviderKeyInfo carries server-derived, read-only details about a key, for AI
        # provider management UIs.
        sig do
          params(
            disabled_model_count: Integer,
            enabled_model_count: Integer,
            is_promotional: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of disabled models provisioned on this key.
          disabled_model_count: nil,
          # Number of enabled models provisioned on this key.
          enabled_model_count: nil,
          # Cadenya includes promotional keys (one for onboarding, and potentially more in
          # the future). These are not added or maintained by account administrators.
          is_promotional: nil
        )
        end

        sig do
          override.returns(
            {
              disabled_model_count: Integer,
              enabled_model_count: Integer,
              is_promotional: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
