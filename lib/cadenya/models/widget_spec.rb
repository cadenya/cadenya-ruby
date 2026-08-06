# frozen_string_literal: true

module Cadenya
  module Models
    class WidgetSpec < Cadenya::Internal::Type::BaseModel
      # @!attribute agent_id
      #   Agent this widget is bound to. Accepts the canonical `agent_…` form or the
      #   `external_id:<value>` form. Sessions copy the agent at mint: re-pointing a
      #   widget's agent affects new sessions only.
      #
      #   @return [String]
      required :agent_id, String, api_name: :agentId

      # @!attribute origin_allowlist
      #   Web origins allowed to embed and use this widget, enforced at the edge on every
      #   browser request. Exact origins only (scheme + host + optional port), no paths,
      #   no wildcard subdomains.
      #
      #   @return [Array<String>, nil]
      optional :origin_allowlist, Cadenya::Internal::Type::ArrayOf[String], api_name: :originAllowlist

      # @!attribute variation_id
      #   Optional explicit variation pin. Must belong to the widget's agent. When set,
      #   every objective created through the widget runs this variation — bypassing the
      #   agent's variation_selection_mode (staged rollout: pin in production, follow in
      #   staging, promote by clearing). When unset, the agent's selection mode chooses
      #   per conversation.
      #
      #   @return [String, nil]
      optional :variation_id, String, api_name: :variationId

      # @!method initialize(agent_id:, origin_allowlist: nil, variation_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::WidgetSpec} for more details.
      #
      #   WidgetSpec is the user-provided configuration for a widget.
      #
      #   @param agent_id [String] Agent this widget is bound to. Accepts the canonical `agent_…` form or the
      #
      #   @param origin_allowlist [Array<String>] Web origins allowed to embed and use this widget, enforced at the edge on
      #
      #   @param variation_id [String] Optional explicit variation pin. Must belong to the widget's agent. When
    end
  end
end
