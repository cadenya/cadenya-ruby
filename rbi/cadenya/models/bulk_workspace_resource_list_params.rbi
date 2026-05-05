# typed: strong

module Cadenya
  module Models
    class BulkWorkspaceResourceListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Cadenya::BulkWorkspaceResourceListParams,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :workspace_id

      # Filter by bundle_key — list every apply for a given bundle.
      sig { returns(T.nilable(String)) }
      attr_reader :bundle_key

      sig { params(bundle_key: String).void }
      attr_writer :bundle_key

      # Pagination cursor from previous response
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Maximum number of results to return
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Sort order for results (asc or desc by creation time)
      sig { returns(T.nilable(String)) }
      attr_reader :sort_order

      sig { params(sort_order: String).void }
      attr_writer :sort_order

      # Filter by lifecycle state.
      sig do
        returns(
          T.nilable(Cadenya::BulkWorkspaceResourceListParams::State::OrSymbol)
        )
      end
      attr_reader :state

      sig do
        params(
          state: Cadenya::BulkWorkspaceResourceListParams::State::OrSymbol
        ).void
      end
      attr_writer :state

      sig do
        params(
          workspace_id: String,
          bundle_key: String,
          cursor: String,
          limit: Integer,
          sort_order: String,
          state: Cadenya::BulkWorkspaceResourceListParams::State::OrSymbol,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        workspace_id:,
        # Filter by bundle_key — list every apply for a given bundle.
        bundle_key: nil,
        # Pagination cursor from previous response
        cursor: nil,
        # Maximum number of results to return
        limit: nil,
        # Sort order for results (asc or desc by creation time)
        sort_order: nil,
        # Filter by lifecycle state.
        state: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            bundle_key: String,
            cursor: String,
            limit: Integer,
            sort_order: String,
            state: Cadenya::BulkWorkspaceResourceListParams::State::OrSymbol,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter by lifecycle state.
      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::BulkWorkspaceResourceListParams::State)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(
            :STATE_UNSPECIFIED,
            Cadenya::BulkWorkspaceResourceListParams::State::TaggedSymbol
          )
        STATE_PENDING =
          T.let(
            :STATE_PENDING,
            Cadenya::BulkWorkspaceResourceListParams::State::TaggedSymbol
          )
        STATE_VALIDATING =
          T.let(
            :STATE_VALIDATING,
            Cadenya::BulkWorkspaceResourceListParams::State::TaggedSymbol
          )
        STATE_RUNNING =
          T.let(
            :STATE_RUNNING,
            Cadenya::BulkWorkspaceResourceListParams::State::TaggedSymbol
          )
        STATE_SUCCEEDED =
          T.let(
            :STATE_SUCCEEDED,
            Cadenya::BulkWorkspaceResourceListParams::State::TaggedSymbol
          )
        STATE_PARTIALLY_APPLIED =
          T.let(
            :STATE_PARTIALLY_APPLIED,
            Cadenya::BulkWorkspaceResourceListParams::State::TaggedSymbol
          )
        STATE_FAILED =
          T.let(
            :STATE_FAILED,
            Cadenya::BulkWorkspaceResourceListParams::State::TaggedSymbol
          )
        STATE_CANCELLED =
          T.let(
            :STATE_CANCELLED,
            Cadenya::BulkWorkspaceResourceListParams::State::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Cadenya::BulkWorkspaceResourceListParams::State::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
