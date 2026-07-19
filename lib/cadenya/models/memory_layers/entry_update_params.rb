# frozen_string_literal: true

module Cadenya
  module Models
    module MemoryLayers
      # @see Cadenya::Resources::MemoryLayers::Entries#update
      class EntryUpdateParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String, nil]
        optional :workspace_id, String

        # @!attribute memory_layer_id
        #
        #   @return [String]
        required :memory_layer_id, String

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute metadata
        #   UpdateResourceMetadata contains the user-provided fields for updating a
        #   workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        #   profile_id, created_at) are excluded since they are set by the server.
        #
        #   @return [Cadenya::Models::UpdateResourceMetadata, nil]
        optional :metadata, -> { Cadenya::UpdateResourceMetadata }

        # @!attribute spec
        #   MemoryEntryUpdateSpec is the input shape for UpdateMemoryEntry. Fields present
        #   in the request's update_mask are applied; unset fields are left alone. The
        #   source oneof is optional for updates — omit it to leave the body untouched, or
        #   set exactly one branch to replace it.
        #
        #   @return [Cadenya::Models::MemoryLayers::MemoryEntryUpdateSpec, nil]
        optional :spec, -> { Cadenya::MemoryLayers::MemoryEntryUpdateSpec }

        # @!attribute update_mask
        #
        #   @return [String, nil]
        optional :update_mask, String, api_name: :updateMask

        # @!method initialize(memory_layer_id:, id:, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::MemoryLayers::EntryUpdateParams} for more details.
        #
        #   @param memory_layer_id [String]
        #
        #   @param id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param metadata [Cadenya::Models::UpdateResourceMetadata] UpdateResourceMetadata contains the user-provided fields for updating
        #
        #   @param spec [Cadenya::Models::MemoryLayers::MemoryEntryUpdateSpec] MemoryEntryUpdateSpec is the input shape for UpdateMemoryEntry. Fields
        #
        #   @param update_mask [String]
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
