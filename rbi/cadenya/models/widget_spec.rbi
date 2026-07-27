# typed: strong

module Cadenya
  module Models
    class WidgetSpec < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::WidgetSpec, Cadenya::Internal::AnyHash) }

      # Agent this widget is bound to. Accepts the canonical `agent_…` form or the
      # `external_id:<value>` form. Sessions copy the agent at mint: re-pointing a
      # widget's agent affects new sessions only.
      sig { returns(String) }
      attr_accessor :agent_id

      # Web origins allowed to embed and use this widget, enforced at the edge on every
      # browser request. Exact origins only (scheme + host + optional port), no paths,
      # no wildcard subdomains.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :origin_allowlist

      sig { params(origin_allowlist: T::Array[String]).void }
      attr_writer :origin_allowlist

      # Optional explicit variation pin. Must belong to the widget's agent. When set,
      # every objective created through the widget runs this variation — bypassing the
      # agent's variation_selection_mode (staged rollout: pin in production, follow in
      # staging, promote by clearing). When unset, the agent's selection mode chooses
      # per conversation.
      sig { returns(T.nilable(String)) }
      attr_reader :variation_id

      sig { params(variation_id: String).void }
      attr_writer :variation_id

      # WidgetSpec is the user-provided configuration for a widget.
      sig do
        params(
          agent_id: String,
          origin_allowlist: T::Array[String],
          variation_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Agent this widget is bound to. Accepts the canonical `agent_…` form or the
        # `external_id:<value>` form. Sessions copy the agent at mint: re-pointing a
        # widget's agent affects new sessions only.
        agent_id:,
        # Web origins allowed to embed and use this widget, enforced at the edge on every
        # browser request. Exact origins only (scheme + host + optional port), no paths,
        # no wildcard subdomains.
        origin_allowlist: nil,
        # Optional explicit variation pin. Must belong to the widget's agent. When set,
        # every objective created through the widget runs this variation — bypassing the
        # agent's variation_selection_mode (staged rollout: pin in production, follow in
        # staging, promote by clearing). When unset, the agent's selection mode chooses
        # per conversation.
        variation_id: nil
      )
      end

      sig do
        override.returns(
          {
            agent_id: String,
            origin_allowlist: T::Array[String],
            variation_id: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
