# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::AIProviderKeys#create
    class AIProviderKey < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata]
      required :metadata, -> { Cadenya::ResourceMetadata }

      # @!attribute spec
      #
      #   @return [Cadenya::Models::AIProviderKeySpec]
      required :spec, -> { Cadenya::AIProviderKeySpec }

      response_only do
        # @!attribute info
        #   AIProviderKeyInfo carries server-derived, read-only details about a key, for AI
        #   provider management UIs.
        #
        #   @return [Cadenya::Models::AIProviderKey::Info, nil]
        optional :info, -> { Cadenya::AIProviderKey::Info }
      end

      # @!method initialize(metadata:, spec:, info: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AIProviderKey} for more details.
      #
      #   AIProviderKey is a credential for an AI provider, scoped to a workspace. Most
      #   keys are customer-provided (BYOK); Cadenya also provisions promotional keys (see
      #   AIProviderKeyInfo.is_promotional), which cannot be modified or deleted by
      #   account administrators. The secret value is never returned in responses.
      #
      #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param spec [Cadenya::Models::AIProviderKeySpec]
      #
      #   @param info [Cadenya::Models::AIProviderKey::Info] AIProviderKeyInfo carries server-derived, read-only details about a key, for

      # @see Cadenya::Models::AIProviderKey#info
      class Info < Cadenya::Internal::Type::BaseModel
        response_only do
          # @!attribute disabled_model_count
          #   Number of disabled models provisioned on this key.
          #
          #   @return [Integer]
          required :disabled_model_count, Integer, api_name: :disabledModelCount

          # @!attribute enabled_model_count
          #   Number of enabled models provisioned on this key.
          #
          #   @return [Integer]
          required :enabled_model_count, Integer, api_name: :enabledModelCount

          # @!attribute is_promotional
          #   Cadenya includes promotional keys (one for onboarding, and potentially more in
          #   the future). These are not added or maintained by account administrators.
          #
          #   @return [Boolean]
          required :is_promotional, Cadenya::Internal::Type::Boolean, api_name: :isPromotional
        end

        # @!method initialize(disabled_model_count:, enabled_model_count:, is_promotional:)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::AIProviderKey::Info} for more details.
        #
        #   AIProviderKeyInfo carries server-derived, read-only details about a key, for AI
        #   provider management UIs.
        #
        #   @param disabled_model_count [Integer] Number of disabled models provisioned on this key.
        #
        #   @param enabled_model_count [Integer] Number of enabled models provisioned on this key.
        #
        #   @param is_promotional [Boolean] Cadenya includes promotional keys (one for onboarding, and potentially more in t
      end
    end
  end
end
