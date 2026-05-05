# typed: strong

module Cadenya
  module Models
    module BulkWorkspaceResources
      class ResultListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::BulkWorkspaceResources::ResultListParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        sig { returns(String) }
        attr_accessor :bulk_workspace_apply_id

        # Filter by action.
        sig do
          returns(
            T.nilable(
              Cadenya::BulkWorkspaceResources::ResultListParams::Action::OrSymbol
            )
          )
        end
        attr_reader :action

        sig do
          params(
            action:
              Cadenya::BulkWorkspaceResources::ResultListParams::Action::OrSymbol
          ).void
        end
        attr_writer :action

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

        # Filter by data.type discriminator (e.g., "toolSet", "memoryEntry").
        sig { returns(T.nilable(String)) }
        attr_reader :type

        sig { params(type: String).void }
        attr_writer :type

        sig do
          params(
            workspace_id: String,
            bulk_workspace_apply_id: String,
            action:
              Cadenya::BulkWorkspaceResources::ResultListParams::Action::OrSymbol,
            cursor: String,
            limit: Integer,
            sort_order: String,
            type: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          workspace_id:,
          bulk_workspace_apply_id:,
          # Filter by action.
          action: nil,
          # Pagination cursor from previous response
          cursor: nil,
          # Maximum number of results to return
          limit: nil,
          # Sort order for results (asc or desc by creation time)
          sort_order: nil,
          # Filter by data.type discriminator (e.g., "toolSet", "memoryEntry").
          type: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              bulk_workspace_apply_id: String,
              action:
                Cadenya::BulkWorkspaceResources::ResultListParams::Action::OrSymbol,
              cursor: String,
              limit: Integer,
              sort_order: String,
              type: String,
              request_options: Cadenya::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Filter by action.
        module Action
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Cadenya::BulkWorkspaceResources::ResultListParams::Action
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTION_UNSPECIFIED =
            T.let(
              :ACTION_UNSPECIFIED,
              Cadenya::BulkWorkspaceResources::ResultListParams::Action::TaggedSymbol
            )
          ACTION_CREATED =
            T.let(
              :ACTION_CREATED,
              Cadenya::BulkWorkspaceResources::ResultListParams::Action::TaggedSymbol
            )
          ACTION_UPDATED =
            T.let(
              :ACTION_UPDATED,
              Cadenya::BulkWorkspaceResources::ResultListParams::Action::TaggedSymbol
            )
          ACTION_UNCHANGED =
            T.let(
              :ACTION_UNCHANGED,
              Cadenya::BulkWorkspaceResources::ResultListParams::Action::TaggedSymbol
            )
          ACTION_DELETED =
            T.let(
              :ACTION_DELETED,
              Cadenya::BulkWorkspaceResources::ResultListParams::Action::TaggedSymbol
            )
          ACTION_FAILED =
            T.let(
              :ACTION_FAILED,
              Cadenya::BulkWorkspaceResources::ResultListParams::Action::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::BulkWorkspaceResources::ResultListParams::Action::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
