# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::MemoryLayers#list
    class MemoryLayerListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String]
      required :workspace_id, String

      # @!attribute agent_id
      #   Filter to episodic layers belonging to this agent.
      #
      #   @return [String, nil]
      optional :agent_id, String

      # @!attribute cursor
      #   Pagination cursor from previous response
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute episodic_key_prefix
      #   Filter to episodic layers whose episodic key starts with this prefix (e.g.
      #   "customer/" matches "customer/42" and "customer/43"). Useful for namespaced
      #   keys, similar to a redis key scan.
      #
      #   @return [String, nil]
      optional :episodic_key_prefix, String

      # @!attribute include_info
      #   When set to true you may use more of your alloted API rate-limit
      #
      #   @return [Boolean, nil]
      optional :include_info, Cadenya::Internal::Type::Boolean

      # @!attribute limit
      #   Maximum number of results to return
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute prefix
      #   Filter expression (query param: prefix)
      #
      #   @return [String, nil]
      optional :prefix, String

      # @!attribute query
      #   Free-form search query
      #
      #   @return [String, nil]
      optional :query, String

      # @!attribute sort_order
      #   Sort order for results (asc or desc by creation time)
      #
      #   @return [String, nil]
      optional :sort_order, String

      # @!attribute type
      #   Filter by layer type
      #
      #   @return [Symbol, Cadenya::Models::MemoryLayerListParams::Type, nil]
      optional :type, enum: -> { Cadenya::MemoryLayerListParams::Type }

      # @!method initialize(workspace_id:, agent_id: nil, cursor: nil, episodic_key_prefix: nil, include_info: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::MemoryLayerListParams} for more details.
      #
      #   @param workspace_id [String]
      #
      #   @param agent_id [String] Filter to episodic layers belonging to this agent.
      #
      #   @param cursor [String] Pagination cursor from previous response
      #
      #   @param episodic_key_prefix [String] Filter to episodic layers whose episodic key starts with this prefix
      #
      #   @param include_info [Boolean] When set to true you may use more of your alloted API rate-limit
      #
      #   @param limit [Integer] Maximum number of results to return
      #
      #   @param prefix [String] Filter expression (query param: prefix)
      #
      #   @param query [String] Free-form search query
      #
      #   @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      #   @param type [Symbol, Cadenya::Models::MemoryLayerListParams::Type] Filter by layer type
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

      # Filter by layer type
      module Type
        extend Cadenya::Internal::Type::Enum

        MEMORY_LAYER_TYPE_UNSPECIFIED = :MEMORY_LAYER_TYPE_UNSPECIFIED
        MEMORY_LAYER_TYPE_EPISODIC = :MEMORY_LAYER_TYPE_EPISODIC
        MEMORY_LAYER_TYPE_SKILLS = :MEMORY_LAYER_TYPE_SKILLS

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
