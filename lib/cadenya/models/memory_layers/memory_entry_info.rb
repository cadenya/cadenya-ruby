# frozen_string_literal: true

module Cadenya
  module Models
    module MemoryLayers
      class MemoryEntryInfo < Cadenya::Internal::Type::BaseModel
        # @!attribute created_by
        #   A profile identifies a user or non-human principal (such as an API key) at the
        #   account level. Profiles are account-scoped and can be granted access to multiple
        #   workspaces.
        #
        #   @return [Cadenya::Models::Profile, nil]
        optional :created_by, -> { Cadenya::Profile }, api_name: :createdBy

        response_only do
          # @!attribute memory_layer
          #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
          #
          #   @return [Cadenya::Models::ResourceMetadata, nil]
          optional :memory_layer, -> { Cadenya::ResourceMetadata }, api_name: :memoryLayer
        end

        # @!method initialize(created_by: nil, memory_layer: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::MemoryLayers::MemoryEntryInfo} for more details.
        #
        #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
        #
        #   @param memory_layer [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      end
    end
  end
end
