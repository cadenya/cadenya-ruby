# typed: strong

module Cadenya
  module Models
    class WidgetSessionListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::WidgetSessionListParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :workspace_id

      sig { params(workspace_id: String).void }
      attr_writer :workspace_id

      # Pagination cursor from previous response.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # When true, the `info` field on each returned session is populated. Requests with
      # this flag count more against your rate limit.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_info

      sig { params(include_info: T::Boolean).void }
      attr_writer :include_info

      # Filters by metadata labels. Comma-separated key=value pairs, e.g.
      # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
      # semantics).
      sig { returns(T.nilable(String)) }
      attr_reader :labels

      sig { params(labels: String).void }
      attr_writer :labels

      # Maximum number of results to return.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Sort order for results (asc or desc by creation time).
      sig { returns(T.nilable(String)) }
      attr_reader :sort_order

      sig { params(sort_order: String).void }
      attr_writer :sort_order

      # Filter by state.
      sig do
        returns(T.nilable(Cadenya::WidgetSessionListParams::State::OrSymbol))
      end
      attr_reader :state

      sig do
        params(state: Cadenya::WidgetSessionListParams::State::OrSymbol).void
      end
      attr_writer :state

      # Filter to sessions asserted for a subject. Accepts the canonical `subj_…` form
      # or the `external_id:<value>` form; the external_id form is scoped within a
      # tenant and requires `tenant_id` to also be set.
      sig { returns(T.nilable(String)) }
      attr_reader :subject_id

      sig { params(subject_id: String).void }
      attr_writer :subject_id

      # Filter to sessions belonging to a tenant. Accepts the canonical `tenant_…` form
      # or the `external_id:<value>` form.
      sig { returns(T.nilable(String)) }
      attr_reader :tenant_id

      sig { params(tenant_id: String).void }
      attr_writer :tenant_id

      # Filter to sessions on a specific widget. Accepts the canonical `wgt_…` form or
      # the `external_id:<value>` form.
      sig { returns(T.nilable(String)) }
      attr_reader :widget_id

      sig { params(widget_id: String).void }
      attr_writer :widget_id

      sig do
        params(
          workspace_id: String,
          cursor: String,
          include_info: T::Boolean,
          labels: String,
          limit: Integer,
          sort_order: String,
          state: Cadenya::WidgetSessionListParams::State::OrSymbol,
          subject_id: String,
          tenant_id: String,
          widget_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        workspace_id: nil,
        # Pagination cursor from previous response.
        cursor: nil,
        # When true, the `info` field on each returned session is populated. Requests with
        # this flag count more against your rate limit.
        include_info: nil,
        # Filters by metadata labels. Comma-separated key=value pairs, e.g.
        # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        # semantics).
        labels: nil,
        # Maximum number of results to return.
        limit: nil,
        # Sort order for results (asc or desc by creation time).
        sort_order: nil,
        # Filter by state.
        state: nil,
        # Filter to sessions asserted for a subject. Accepts the canonical `subj_…` form
        # or the `external_id:<value>` form; the external_id form is scoped within a
        # tenant and requires `tenant_id` to also be set.
        subject_id: nil,
        # Filter to sessions belonging to a tenant. Accepts the canonical `tenant_…` form
        # or the `external_id:<value>` form.
        tenant_id: nil,
        # Filter to sessions on a specific widget. Accepts the canonical `wgt_…` form or
        # the `external_id:<value>` form.
        widget_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            cursor: String,
            include_info: T::Boolean,
            labels: String,
            limit: Integer,
            sort_order: String,
            state: Cadenya::WidgetSessionListParams::State::OrSymbol,
            subject_id: String,
            tenant_id: String,
            widget_id: String,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter by state.
      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::WidgetSessionListParams::State)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(
            :STATE_UNSPECIFIED,
            Cadenya::WidgetSessionListParams::State::TaggedSymbol
          )
        STATE_ACTIVE =
          T.let(
            :STATE_ACTIVE,
            Cadenya::WidgetSessionListParams::State::TaggedSymbol
          )
        STATE_EXPIRED =
          T.let(
            :STATE_EXPIRED,
            Cadenya::WidgetSessionListParams::State::TaggedSymbol
          )
        STATE_REVOKED =
          T.let(
            :STATE_REVOKED,
            Cadenya::WidgetSessionListParams::State::TaggedSymbol
          )
        STATE_EXHAUSTED =
          T.let(
            :STATE_EXHAUSTED,
            Cadenya::WidgetSessionListParams::State::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::WidgetSessionListParams::State::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
