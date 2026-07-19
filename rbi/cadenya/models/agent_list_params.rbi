# typed: strong

module Cadenya
  module Models
    class AgentListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::AgentListParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :workspace_id

      sig { params(workspace_id: String).void }
      attr_writer :workspace_id

      # Pagination cursor from previous response
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # When true, the `info` field on each returned agent is populated. Requests with
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

      # Maximum number of results to return
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Filter expression (query param: prefix)
      sig { returns(T.nilable(String)) }
      attr_reader :prefix

      sig { params(prefix: String).void }
      attr_writer :prefix

      # Free-form search query
      sig { returns(T.nilable(String)) }
      attr_reader :query

      sig { params(query: String).void }
      attr_writer :query

      # Sort order for results (asc or desc by creation time)
      sig { returns(T.nilable(String)) }
      attr_reader :sort_order

      sig { params(sort_order: String).void }
      attr_writer :sort_order

      # Filter by agent lifecycle state
      sig { returns(T.nilable(Cadenya::AgentListParams::State::OrSymbol)) }
      attr_reader :state

      sig { params(state: Cadenya::AgentListParams::State::OrSymbol).void }
      attr_writer :state

      # Filter by variation selection mode
      sig do
        returns(
          T.nilable(Cadenya::AgentListParams::VariationSelectionMode::OrSymbol)
        )
      end
      attr_reader :variation_selection_mode

      sig do
        params(
          variation_selection_mode:
            Cadenya::AgentListParams::VariationSelectionMode::OrSymbol
        ).void
      end
      attr_writer :variation_selection_mode

      sig do
        params(
          workspace_id: String,
          cursor: String,
          include_info: T::Boolean,
          labels: String,
          limit: Integer,
          prefix: String,
          query: String,
          sort_order: String,
          state: Cadenya::AgentListParams::State::OrSymbol,
          variation_selection_mode:
            Cadenya::AgentListParams::VariationSelectionMode::OrSymbol,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        workspace_id: nil,
        # Pagination cursor from previous response
        cursor: nil,
        # When true, the `info` field on each returned agent is populated. Requests with
        # this flag count more against your rate limit.
        include_info: nil,
        # Filters by metadata labels. Comma-separated key=value pairs, e.g.
        # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        # semantics).
        labels: nil,
        # Maximum number of results to return
        limit: nil,
        # Filter expression (query param: prefix)
        prefix: nil,
        # Free-form search query
        query: nil,
        # Sort order for results (asc or desc by creation time)
        sort_order: nil,
        # Filter by agent lifecycle state
        state: nil,
        # Filter by variation selection mode
        variation_selection_mode: nil,
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
            prefix: String,
            query: String,
            sort_order: String,
            state: Cadenya::AgentListParams::State::OrSymbol,
            variation_selection_mode:
              Cadenya::AgentListParams::VariationSelectionMode::OrSymbol,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter by agent lifecycle state
      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::AgentListParams::State) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(
            :STATE_UNSPECIFIED,
            Cadenya::AgentListParams::State::TaggedSymbol
          )
        STATE_DRAFT =
          T.let(:STATE_DRAFT, Cadenya::AgentListParams::State::TaggedSymbol)
        STATE_PUBLISHED =
          T.let(:STATE_PUBLISHED, Cadenya::AgentListParams::State::TaggedSymbol)
        STATE_ARCHIVED =
          T.let(:STATE_ARCHIVED, Cadenya::AgentListParams::State::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::AgentListParams::State::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Filter by variation selection mode
      module VariationSelectionMode
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::AgentListParams::VariationSelectionMode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        VARIATION_SELECTION_MODE_UNSPECIFIED =
          T.let(
            :VARIATION_SELECTION_MODE_UNSPECIFIED,
            Cadenya::AgentListParams::VariationSelectionMode::TaggedSymbol
          )
        VARIATION_SELECTION_MODE_RANDOM =
          T.let(
            :VARIATION_SELECTION_MODE_RANDOM,
            Cadenya::AgentListParams::VariationSelectionMode::TaggedSymbol
          )
        VARIATION_SELECTION_MODE_WEIGHTED =
          T.let(
            :VARIATION_SELECTION_MODE_WEIGHTED,
            Cadenya::AgentListParams::VariationSelectionMode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Cadenya::AgentListParams::VariationSelectionMode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
