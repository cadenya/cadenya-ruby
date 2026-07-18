# typed: strong

module Cadenya
  module Models
    class APIKey < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::APIKey, Cadenya::Internal::AnyHash) }

      # AccountResourceMetadata is used to represent a resource that is associated to an
      # account but not to a workspace.
      sig { returns(Cadenya::AccountResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::AccountResourceMetadata::OrHash).void }
      attr_writer :metadata

      # Configuration for an API key.
      sig { returns(Cadenya::APIKeySpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::APIKeySpec::OrHash).void }
      attr_writer :spec

      sig { returns(T.nilable(Cadenya::APIKeyInfo)) }
      attr_reader :info

      sig { params(info: Cadenya::APIKeyInfo::OrHash).void }
      attr_writer :info

      # The current lifecycle state of the API key. Output only. Keys are created
      # STATE_ENABLED; use the :disable and :enable actions to transition between
      # states.
      sig { returns(Cadenya::APIKey::State::TaggedSymbol) }
      attr_accessor :state

      # An API key. Every key belongs to exactly one workspace and is managed via the
      # workspace-scoped API key routes. The only exception is the system-managed global
      # account key, which spans all workspaces and is managed via the account
      # global_api_key routes.
      sig do
        params(
          metadata: Cadenya::AccountResourceMetadata::OrHash,
          spec: Cadenya::APIKeySpec::OrHash,
          state: Cadenya::APIKey::State::OrSymbol,
          info: Cadenya::APIKeyInfo::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # AccountResourceMetadata is used to represent a resource that is associated to an
        # account but not to a workspace.
        metadata:,
        # Configuration for an API key.
        spec:,
        # The current lifecycle state of the API key. Output only. Keys are created
        # STATE_ENABLED; use the :disable and :enable actions to transition between
        # states.
        state:,
        info: nil
      )
      end

      sig do
        override.returns(
          {
            metadata: Cadenya::AccountResourceMetadata,
            spec: Cadenya::APIKeySpec,
            state: Cadenya::APIKey::State::TaggedSymbol,
            info: Cadenya::APIKeyInfo
          }
        )
      end
      def to_hash
      end

      # The current lifecycle state of the API key. Output only. Keys are created
      # STATE_ENABLED; use the :disable and :enable actions to transition between
      # states.
      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Cadenya::APIKey::State) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(:STATE_UNSPECIFIED, Cadenya::APIKey::State::TaggedSymbol)
        STATE_ENABLED =
          T.let(:STATE_ENABLED, Cadenya::APIKey::State::TaggedSymbol)
        STATE_DISABLED =
          T.let(:STATE_DISABLED, Cadenya::APIKey::State::TaggedSymbol)

        sig { override.returns(T::Array[Cadenya::APIKey::State::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
