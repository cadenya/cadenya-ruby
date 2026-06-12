# typed: strong

module Cadenya
  module Models
    class Model < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::Model, Cadenya::Internal::AnyHash) }

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :metadata

      # Model specification
      sig { returns(Cadenya::ModelSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::ModelSpec::OrHash).void }
      attr_writer :spec

      # Whether the model is usable in this workspace. Output only. Use the :enable and
      # :disable actions to transition.
      sig { returns(Cadenya::Model::State::TaggedSymbol) }
      attr_accessor :state

      # ModelInfo carries server-derived, read-only details about a model.
      sig { returns(T.nilable(Cadenya::Model::Info)) }
      attr_reader :info

      sig { params(info: Cadenya::Model::Info::OrHash).void }
      attr_writer :info

      sig do
        params(
          metadata: Cadenya::ResourceMetadata::OrHash,
          spec: Cadenya::ModelSpec::OrHash,
          state: Cadenya::Model::State::OrSymbol,
          info: Cadenya::Model::Info::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        metadata:,
        # Model specification
        spec:,
        # Whether the model is usable in this workspace. Output only. Use the :enable and
        # :disable actions to transition.
        state:,
        # ModelInfo carries server-derived, read-only details about a model.
        info: nil
      )
      end

      sig do
        override.returns(
          {
            metadata: Cadenya::ResourceMetadata,
            spec: Cadenya::ModelSpec,
            state: Cadenya::Model::State::TaggedSymbol,
            info: Cadenya::Model::Info
          }
        )
      end
      def to_hash
      end

      # Whether the model is usable in this workspace. Output only. Use the :enable and
      # :disable actions to transition.
      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Cadenya::Model::State) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(:STATE_UNSPECIFIED, Cadenya::Model::State::TaggedSymbol)
        STATE_ENABLED =
          T.let(:STATE_ENABLED, Cadenya::Model::State::TaggedSymbol)
        STATE_DISABLED =
          T.let(:STATE_DISABLED, Cadenya::Model::State::TaggedSymbol)

        sig { override.returns(T::Array[Cadenya::Model::State::TaggedSymbol]) }
        def self.values
        end
      end

      class Info < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::Model::Info, Cadenya::Internal::AnyHash)
          end

        # Number of agent variations currently provisioned on this model. Useful for
        # previewing how many variations a swap would affect.
        sig { returns(T.nilable(Integer)) }
        attr_reader :agent_variation_count

        sig { params(agent_variation_count: Integer).void }
        attr_writer :agent_variation_count

        # AIProviderKey is a credential for an AI provider, scoped to a workspace. Most
        # keys are customer-provided (BYOK); Cadenya also provisions promotional keys (see
        # AIProviderKeyInfo.is_promotional), which cannot be modified or deleted by
        # account administrators. The secret value is never returned in responses.
        sig { returns(T.nilable(Cadenya::AIProviderKey)) }
        attr_reader :ai_provider_key

        sig { params(ai_provider_key: Cadenya::AIProviderKey::OrHash).void }
        attr_writer :ai_provider_key

        # Represents the last time this model was used in an agent objective
        sig { returns(T.nilable(Time)) }
        attr_reader :last_used_at

        sig { params(last_used_at: Time).void }
        attr_writer :last_used_at

        # ModelInfo carries server-derived, read-only details about a model.
        sig do
          params(
            agent_variation_count: Integer,
            ai_provider_key: Cadenya::AIProviderKey::OrHash,
            last_used_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of agent variations currently provisioned on this model. Useful for
          # previewing how many variations a swap would affect.
          agent_variation_count: nil,
          # AIProviderKey is a credential for an AI provider, scoped to a workspace. Most
          # keys are customer-provided (BYOK); Cadenya also provisions promotional keys (see
          # AIProviderKeyInfo.is_promotional), which cannot be modified or deleted by
          # account administrators. The secret value is never returned in responses.
          ai_provider_key: nil,
          # Represents the last time this model was used in an agent objective
          last_used_at: nil
        )
        end

        sig do
          override.returns(
            {
              agent_variation_count: Integer,
              ai_provider_key: Cadenya::AIProviderKey,
              last_used_at: Time
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
