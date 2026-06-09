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

        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        sig { returns(T.nilable(Cadenya::ResourceMetadata)) }
        attr_reader :ai_provider_key

        sig { params(ai_provider_key: Cadenya::ResourceMetadata::OrHash).void }
        attr_writer :ai_provider_key

        # The AI provider this model routes through (via its provider key).
        sig { returns(T.nilable(Cadenya::Model::Info::Provider::TaggedSymbol)) }
        attr_reader :provider

        sig { params(provider: Cadenya::Model::Info::Provider::OrSymbol).void }
        attr_writer :provider

        # ModelInfo carries server-derived, read-only details about a model.
        sig do
          params(
            agent_variation_count: Integer,
            ai_provider_key: Cadenya::ResourceMetadata::OrHash,
            provider: Cadenya::Model::Info::Provider::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of agent variations currently provisioned on this model. Useful for
          # previewing how many variations a swap would affect.
          agent_variation_count: nil,
          # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
          ai_provider_key: nil,
          # The AI provider this model routes through (via its provider key).
          provider: nil
        )
        end

        sig do
          override.returns(
            {
              agent_variation_count: Integer,
              ai_provider_key: Cadenya::ResourceMetadata,
              provider: Cadenya::Model::Info::Provider::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The AI provider this model routes through (via its provider key).
        module Provider
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Cadenya::Model::Info::Provider) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AI_PROVIDER_UNSPECIFIED =
            T.let(
              :AI_PROVIDER_UNSPECIFIED,
              Cadenya::Model::Info::Provider::TaggedSymbol
            )
          AI_PROVIDER_OPENROUTER =
            T.let(
              :AI_PROVIDER_OPENROUTER,
              Cadenya::Model::Info::Provider::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Cadenya::Model::Info::Provider::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
