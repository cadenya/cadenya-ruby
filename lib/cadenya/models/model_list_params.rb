# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Models#list
    class ModelListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!attribute ai_provider_key_id
      #   Filter to models provisioned on a specific AI provider key. Accepts the key's id
      #   or an "external_id:"-prefixed slug.
      #
      #   @return [String, nil]
      optional :ai_provider_key_id, String

      # @!attribute cursor
      #   Pagination cursor from previous response
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute include_info
      #   When true, populate each item's info (e.g. the AI provider), at the cost of
      #   extra lookups.
      #
      #   @return [Boolean, nil]
      optional :include_info, Cadenya::Internal::Type::Boolean

      # @!attribute is_assigned
      #   Filter models to only ones assigned to an active agent variation/agent. Draft
      #   agents count as assigned; archived agents do not. Assignment does not imply
      #   recent traffic — see ModelInfo.last_used_at for that.
      #
      #   @return [Boolean, nil]
      optional :is_assigned, Cadenya::Internal::Type::Boolean

      # @!attribute labels
      #   Filters by metadata labels. Comma-separated key=value pairs, e.g.
      #   "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
      #   semantics).
      #
      #   @return [String, nil]
      optional :labels, String

      # @!attribute limit
      #   Maximum number of results to return
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute prefix
      #   Filter by a prefix of the model's display name, external id, or id
      #   (case-insensitive). A model's external id is the form used in
      #   modelConfig.modelId, so a caller holding that can narrow the list by it.
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

      # @!attribute state
      #   Filter by model state
      #
      #   @return [Symbol, Cadenya::Models::ModelListParams::State, nil]
      optional :state, enum: -> { Cadenya::ModelListParams::State }

      # @!method initialize(workspace_id: nil, ai_provider_key_id: nil, cursor: nil, include_info: nil, is_assigned: nil, labels: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, state: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ModelListParams} for more details.
      #
      #   @param workspace_id [String]
      #
      #   @param ai_provider_key_id [String] Filter to models provisioned on a specific AI provider key. Accepts the
      #
      #   @param cursor [String] Pagination cursor from previous response
      #
      #   @param include_info [Boolean] When true, populate each item's info (e.g. the AI provider), at the cost of
      #
      #   @param is_assigned [Boolean] Filter models to only ones assigned to an active agent variation/agent.
      #
      #   @param labels [String] Filters by metadata labels. Comma-separated key=value pairs,
      #
      #   @param limit [Integer] Maximum number of results to return
      #
      #   @param prefix [String] Filter by a prefix of the model's display name, external id, or id
      #
      #   @param query [String] Free-form search query
      #
      #   @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      #   @param state [Symbol, Cadenya::Models::ModelListParams::State] Filter by model state
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

      # Filter by model state
      module State
        extend Cadenya::Internal::Type::Enum

        STATE_UNSPECIFIED = :STATE_UNSPECIFIED
        STATE_ENABLED = :STATE_ENABLED
        STATE_DISABLED = :STATE_DISABLED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
