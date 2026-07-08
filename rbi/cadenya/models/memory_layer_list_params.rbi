# typed: strong

module Cadenya
  module Models
    class MemoryLayerListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::MemoryLayerListParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :workspace_id

      # Filter to episodic layers belonging to this agent.
      sig { returns(T.nilable(String)) }
      attr_reader :agent_id

      sig { params(agent_id: String).void }
      attr_writer :agent_id

      # Pagination cursor from previous response
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Filter to episodic layers whose episodic key starts with this prefix (e.g.
      # "customer/" matches "customer/42" and "customer/43"). Useful for namespaced
      # keys, similar to a redis key scan.
      sig { returns(T.nilable(String)) }
      attr_reader :episodic_key_prefix

      sig { params(episodic_key_prefix: String).void }
      attr_writer :episodic_key_prefix

      # When set to true you may use more of your alloted API rate-limit
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

      # Filter by layer type
      sig { returns(T.nilable(Cadenya::MemoryLayerListParams::Type::OrSymbol)) }
      attr_reader :type

      sig { params(type: Cadenya::MemoryLayerListParams::Type::OrSymbol).void }
      attr_writer :type

      sig do
        params(
          workspace_id: String,
          agent_id: String,
          cursor: String,
          episodic_key_prefix: String,
          include_info: T::Boolean,
          labels: String,
          limit: Integer,
          prefix: String,
          query: String,
          sort_order: String,
          type: Cadenya::MemoryLayerListParams::Type::OrSymbol,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        workspace_id:,
        # Filter to episodic layers belonging to this agent.
        agent_id: nil,
        # Pagination cursor from previous response
        cursor: nil,
        # Filter to episodic layers whose episodic key starts with this prefix (e.g.
        # "customer/" matches "customer/42" and "customer/43"). Useful for namespaced
        # keys, similar to a redis key scan.
        episodic_key_prefix: nil,
        # When set to true you may use more of your alloted API rate-limit
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
        # Filter by layer type
        type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            agent_id: String,
            cursor: String,
            episodic_key_prefix: String,
            include_info: T::Boolean,
            labels: String,
            limit: Integer,
            prefix: String,
            query: String,
            sort_order: String,
            type: Cadenya::MemoryLayerListParams::Type::OrSymbol,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter by layer type
      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::MemoryLayerListParams::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MEMORY_LAYER_TYPE_UNSPECIFIED =
          T.let(
            :MEMORY_LAYER_TYPE_UNSPECIFIED,
            Cadenya::MemoryLayerListParams::Type::TaggedSymbol
          )
        MEMORY_LAYER_TYPE_EPISODIC =
          T.let(
            :MEMORY_LAYER_TYPE_EPISODIC,
            Cadenya::MemoryLayerListParams::Type::TaggedSymbol
          )
        MEMORY_LAYER_TYPE_SKILLS =
          T.let(
            :MEMORY_LAYER_TYPE_SKILLS,
            Cadenya::MemoryLayerListParams::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::MemoryLayerListParams::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
