# frozen_string_literal: true

module Cadenya
  module Models
    module MemoryLayers
      # @see Cadenya::Resources::MemoryLayers::Entries#create
      class EntryCreateParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!attribute memory_layer_id
        #
        #   @return [String]
        required :memory_layer_id, String

        # @!attribute metadata
        #   CreateResourceMetadata contains the user-provided fields for creating a
        #   workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        #   profile_id, created_at) are excluded since they are set by the server.
        #
        #   @return [Cadenya::Models::CreateResourceMetadata]
        required :metadata, -> { Cadenya::CreateResourceMetadata }

        # @!attribute spec
        #   MemoryEntryCreateSpec is the input shape for CreateMemoryEntry. It accepts
        #   either inline content or a reference to a completed Upload; exactly one of the
        #   two must be set.
        #
        #   @return [Cadenya::Models::MemoryLayers::MemoryEntryCreateSpec]
        required :spec, -> { Cadenya::MemoryLayers::MemoryEntryCreateSpec }

        # @!method initialize(workspace_id:, memory_layer_id:, metadata:, spec:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::MemoryLayers::EntryCreateParams} for more details.
        #
        #   @param workspace_id [String]
        #
        #   @param memory_layer_id [String]
        #
        #   @param metadata [Cadenya::Models::CreateResourceMetadata] CreateResourceMetadata contains the user-provided fields for creating
        #
        #   @param spec [Cadenya::Models::MemoryLayers::MemoryEntryCreateSpec] MemoryEntryCreateSpec is the input shape for CreateMemoryEntry. It accepts
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
