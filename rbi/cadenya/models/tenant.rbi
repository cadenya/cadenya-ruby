# typed: strong

module Cadenya
  module Models
    class Tenant < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::Tenant, Cadenya::Internal::AnyHash) }

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :metadata

      # TenantInfo provides read-only server-derived data about a tenant.
      sig { returns(T.nilable(Cadenya::TenantInfo)) }
      attr_reader :info

      sig { params(info: Cadenya::TenantInfo::OrHash).void }
      attr_writer :info

      # The current lifecycle state of the tenant. Output only.
      sig { returns(Cadenya::Tenant::State::TaggedSymbol) }
      attr_accessor :state

      # Tenant is the customer's organization as a readable record rather than an echo.
      # It carries no spec: a tenant is never configured, only asserted, so everything
      # about it lives in the metadata envelope — `external_id` is the key the customer
      # asserted it under, `name` is the most recent name they asserted, and
      # `updated_at` is therefore when the tenant was last asserted.
      sig do
        params(
          metadata: Cadenya::ResourceMetadata::OrHash,
          state: Cadenya::Tenant::State::OrSymbol,
          info: Cadenya::TenantInfo::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        metadata:,
        # The current lifecycle state of the tenant. Output only.
        state:,
        # TenantInfo provides read-only server-derived data about a tenant.
        info: nil
      )
      end

      sig do
        override.returns(
          {
            metadata: Cadenya::ResourceMetadata,
            state: Cadenya::Tenant::State::TaggedSymbol,
            info: Cadenya::TenantInfo
          }
        )
      end
      def to_hash
      end

      # The current lifecycle state of the tenant. Output only.
      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Cadenya::Tenant::State) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(:STATE_UNSPECIFIED, Cadenya::Tenant::State::TaggedSymbol)
        STATE_ACTIVE =
          T.let(:STATE_ACTIVE, Cadenya::Tenant::State::TaggedSymbol)
        STATE_ERASING =
          T.let(:STATE_ERASING, Cadenya::Tenant::State::TaggedSymbol)

        sig { override.returns(T::Array[Cadenya::Tenant::State::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
