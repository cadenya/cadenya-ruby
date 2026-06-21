# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Workspaces#list
    class Workspace < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   AccountResourceMetadata is used to represent a resource that is associated to an
      #   account but not to a workspace.
      #
      #   @return [Cadenya::Models::AccountResourceMetadata]
      required :metadata, -> { Cadenya::AccountResourceMetadata }

      # @!attribute spec
      #
      #   @return [Cadenya::Models::WorkspaceSpec]
      required :spec, -> { Cadenya::WorkspaceSpec }

      response_only do
        # @!attribute info
        #   WorkspaceInfo returns counts
        #
        #   @return [Cadenya::Models::Workspace::Info, nil]
        optional :info, -> { Cadenya::Workspace::Info }

        # @!attribute status
        #   Lifecycle status of the workspace. Archived workspaces reject all requests
        #   scoped to them. Server-populated.
        #
        #   @return [Symbol, Cadenya::Models::Workspace::Status, nil]
        optional :status, enum: -> { Cadenya::Workspace::Status }
      end

      # @!method initialize(metadata:, spec:, info: nil, status: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::Workspace} for more details.
      #
      #   @param metadata [Cadenya::Models::AccountResourceMetadata] AccountResourceMetadata is used to represent a resource that is associated to an
      #
      #   @param spec [Cadenya::Models::WorkspaceSpec]
      #
      #   @param info [Cadenya::Models::Workspace::Info] WorkspaceInfo returns counts
      #
      #   @param status [Symbol, Cadenya::Models::Workspace::Status] Lifecycle status of the workspace. Archived workspaces reject all

      # @see Cadenya::Models::Workspace#info
      class Info < Cadenya::Internal::Type::BaseModel
        # @!attribute total_agents
        #
        #   @return [Integer, nil]
        optional :total_agents, Integer, api_name: :totalAgents

        # @!attribute total_agent_variations
        #
        #   @return [Integer, nil]
        optional :total_agent_variations, Integer, api_name: :totalAgentVariations

        # @!attribute total_available_tools
        #
        #   @return [Integer, nil]
        optional :total_available_tools, Integer, api_name: :totalAvailableTools

        # @!attribute total_memory_entries
        #
        #   @return [Integer, nil]
        optional :total_memory_entries, Integer, api_name: :totalMemoryEntries

        # @!method initialize(total_agents: nil, total_agent_variations: nil, total_available_tools: nil, total_memory_entries: nil)
        #   WorkspaceInfo returns counts
        #
        #   @param total_agents [Integer]
        #   @param total_agent_variations [Integer]
        #   @param total_available_tools [Integer]
        #   @param total_memory_entries [Integer]
      end

      # Lifecycle status of the workspace. Archived workspaces reject all requests
      # scoped to them. Server-populated.
      #
      # @see Cadenya::Models::Workspace#status
      module Status
        extend Cadenya::Internal::Type::Enum

        STATUS_ENABLED = :STATUS_ENABLED
        STATUS_DISABLED = :STATUS_DISABLED
        STATUS_ARCHIVED = :STATUS_ARCHIVED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
