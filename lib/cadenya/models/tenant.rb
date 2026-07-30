# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Tenants#retrieve
    class Tenant < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata]
      required :metadata, -> { Cadenya::ResourceMetadata }

      # @!attribute info
      #   TenantInfo provides read-only server-derived data about a tenant.
      #
      #   @return [Cadenya::Models::TenantInfo, nil]
      optional :info, -> { Cadenya::TenantInfo }

      response_only do
        # @!attribute state
        #   The current lifecycle state of the tenant. Output only.
        #
        #   @return [Symbol, Cadenya::Models::Tenant::State]
        required :state, enum: -> { Cadenya::Tenant::State }
      end

      # @!method initialize(metadata:, state:, info: nil)
      #   Some parameter documentations has been truncated, see {Cadenya::Models::Tenant}
      #   for more details.
      #
      #   Tenant is the customer's organization as a readable record rather than an echo.
      #   It carries no spec: a tenant is never configured, only asserted, so everything
      #   about it lives in the metadata envelope — `external_id` is the key the customer
      #   asserted it under, `name` is the most recent name they asserted, and
      #   `updated_at` is therefore when the tenant was last asserted.
      #
      #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param state [Symbol, Cadenya::Models::Tenant::State] The current lifecycle state of the tenant. Output only.
      #
      #   @param info [Cadenya::Models::TenantInfo] TenantInfo provides read-only server-derived data about a tenant.

      # The current lifecycle state of the tenant. Output only.
      #
      # @see Cadenya::Models::Tenant#state
      module State
        extend Cadenya::Internal::Type::Enum

        STATE_UNSPECIFIED = :STATE_UNSPECIFIED
        STATE_ACTIVE = :STATE_ACTIVE
        STATE_ERASING = :STATE_ERASING

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
