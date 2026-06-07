# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Models#retrieve
    class Model < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata]
      required :metadata, -> { Cadenya::ResourceMetadata }

      # @!attribute spec
      #   Model specification
      #
      #   @return [Cadenya::Models::ModelSpec]
      required :spec, -> { Cadenya::ModelSpec }

      response_only do
        # @!attribute info
        #   ModelInfo carries server-derived, read-only details about a model.
        #
        #   @return [Cadenya::Models::Model::Info, nil]
        optional :info, -> { Cadenya::Model::Info }
      end

      # @!method initialize(metadata:, spec:, info: nil)
      #   Some parameter documentations has been truncated, see {Cadenya::Models::Model}
      #   for more details.
      #
      #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param spec [Cadenya::Models::ModelSpec] Model specification
      #
      #   @param info [Cadenya::Models::Model::Info] ModelInfo carries server-derived, read-only details about a model.

      # @see Cadenya::Models::Model#info
      class Info < Cadenya::Internal::Type::BaseModel
        response_only do
          # @!attribute agent_variation_count
          #   Number of agent variations currently provisioned on this model. Useful for
          #   previewing how many variations a swap would affect.
          #
          #   @return [Integer, nil]
          optional :agent_variation_count, Integer, api_name: :agentVariationCount

          # @!attribute ai_provider_key
          #   BareMetadata contains the minimal metadata for a resource: the ID and an
          #   optional human-readable name. These are used for reference fields where the full
          #   metadata (account scoping, timestamps, labels, external IDs) is not needed —
          #   e.g., the tool references inside an agent variation spec or the tools assigned
          #   to an objective. Both fields are server-populated; clients provide IDs through
          #   sibling fields rather than by constructing a BareMetadata themselves.
          #
          #   @return [Cadenya::Models::BareMetadata, nil]
          optional :ai_provider_key, -> { Cadenya::BareMetadata }, api_name: :aiProviderKey

          # @!attribute provider
          #   The AI provider this model routes through (via its provider key).
          #
          #   @return [Symbol, Cadenya::Models::Model::Info::Provider, nil]
          optional :provider, enum: -> { Cadenya::Model::Info::Provider }
        end

        # @!method initialize(agent_variation_count: nil, ai_provider_key: nil, provider: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Model::Info} for more details.
        #
        #   ModelInfo carries server-derived, read-only details about a model.
        #
        #   @param agent_variation_count [Integer] Number of agent variations currently provisioned on this model. Useful for
        #
        #   @param ai_provider_key [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
        #
        #   @param provider [Symbol, Cadenya::Models::Model::Info::Provider] The AI provider this model routes through (via its provider key).

        # The AI provider this model routes through (via its provider key).
        #
        # @see Cadenya::Models::Model::Info#provider
        module Provider
          extend Cadenya::Internal::Type::Enum

          AI_PROVIDER_UNSPECIFIED = :AI_PROVIDER_UNSPECIFIED
          AI_PROVIDER_OPENROUTER = :AI_PROVIDER_OPENROUTER

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
