# typed: strong

module Cadenya
  module Models
    class ModelListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::ModelListParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :workspace_id

      # Filter to models provisioned on a specific AI provider key. Accepts the key's id
      # or an "external_id:"-prefixed slug.
      sig { returns(T.nilable(String)) }
      attr_reader :ai_provider_key_id

      sig { params(ai_provider_key_id: String).void }
      attr_writer :ai_provider_key_id

      # Filter by bundle_key — return only resources owned by this bundle.
      sig { returns(T.nilable(String)) }
      attr_reader :bundle_key

      sig { params(bundle_key: String).void }
      attr_writer :bundle_key

      # Pagination cursor from previous response
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # When true, populate each item's info (e.g. the AI provider), at the cost of
      # extra lookups.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_info

      sig { params(include_info: T::Boolean).void }
      attr_writer :include_info

      # Filter models to only ones assigned to an active agent variation/agent. Draft
      # agents count as assigned; archived agents do not. Assignment does not imply
      # recent traffic — see ModelInfo.last_used_at for that.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_assigned

      sig { params(is_assigned: T::Boolean).void }
      attr_writer :is_assigned

      # Maximum number of results to return
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Filter by name prefix
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

      # Filter by model state
      sig { returns(T.nilable(Cadenya::ModelListParams::State::OrSymbol)) }
      attr_reader :state

      sig { params(state: Cadenya::ModelListParams::State::OrSymbol).void }
      attr_writer :state

      sig do
        params(
          workspace_id: String,
          ai_provider_key_id: String,
          bundle_key: String,
          cursor: String,
          include_info: T::Boolean,
          is_assigned: T::Boolean,
          limit: Integer,
          prefix: String,
          query: String,
          sort_order: String,
          state: Cadenya::ModelListParams::State::OrSymbol,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        workspace_id:,
        # Filter to models provisioned on a specific AI provider key. Accepts the key's id
        # or an "external_id:"-prefixed slug.
        ai_provider_key_id: nil,
        # Filter by bundle_key — return only resources owned by this bundle.
        bundle_key: nil,
        # Pagination cursor from previous response
        cursor: nil,
        # When true, populate each item's info (e.g. the AI provider), at the cost of
        # extra lookups.
        include_info: nil,
        # Filter models to only ones assigned to an active agent variation/agent. Draft
        # agents count as assigned; archived agents do not. Assignment does not imply
        # recent traffic — see ModelInfo.last_used_at for that.
        is_assigned: nil,
        # Maximum number of results to return
        limit: nil,
        # Filter by name prefix
        prefix: nil,
        # Free-form search query
        query: nil,
        # Sort order for results (asc or desc by creation time)
        sort_order: nil,
        # Filter by model state
        state: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            ai_provider_key_id: String,
            bundle_key: String,
            cursor: String,
            include_info: T::Boolean,
            is_assigned: T::Boolean,
            limit: Integer,
            prefix: String,
            query: String,
            sort_order: String,
            state: Cadenya::ModelListParams::State::OrSymbol,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter by model state
      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::ModelListParams::State) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(
            :STATE_UNSPECIFIED,
            Cadenya::ModelListParams::State::TaggedSymbol
          )
        STATE_ENABLED =
          T.let(:STATE_ENABLED, Cadenya::ModelListParams::State::TaggedSymbol)
        STATE_DISABLED =
          T.let(:STATE_DISABLED, Cadenya::ModelListParams::State::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::ModelListParams::State::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
