# typed: strong

module Cadenya
  module Models
    module BulkWorkspaceResources
      class BulkWorkspaceApplyResultDataVariationAssignmentOutcome < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome,
              Cadenya::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Action::TaggedSymbol
            )
          )
        end
        attr_reader :action

        sig do
          params(
            action:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Action::OrSymbol
          ).void
        end
        attr_writer :action

        # The `Status` type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by
        # [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of
        # data: error code, error message, and error details. You can find out more about
        # this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        sig do
          returns(
            T.nilable(
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Error
            )
          )
        end
        attr_reader :error

        sig do
          params(
            error:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Error::OrHash
          ).void
        end
        attr_writer :error

        # A read-only reference to a single tool, tool set, or sub-agent attached to a
        # variation. Read the full set of assignments via
        # `AgentVariationInfo.assignments`; mutations go through the dedicated add/remove
        # assignment endpoints.
        #
        # The `id` identifies the assignment itself (not the referenced resource) and is
        # the handle used to remove the assignment. It is returned by the add endpoint and
        # present on every entry in `AgentVariationInfo.assignments`.
        sig { returns(T.nilable(Cadenya::Agents::VariationAssignment)) }
        attr_reader :resource

        sig do
          params(resource: Cadenya::Agents::VariationAssignment::OrHash).void
        end
        attr_writer :resource

        sig do
          params(
            action:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Action::OrSymbol,
            error:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Error::OrHash,
            resource: Cadenya::Agents::VariationAssignment::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          action: nil,
          # The `Status` type defines a logical error model that is suitable for different
          # programming environments, including REST APIs and RPC APIs. It is used by
          # [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of
          # data: error code, error message, and error details. You can find out more about
          # this error model and how to work with it in the
          # [API Design Guide](https://cloud.google.com/apis/design/errors).
          error: nil,
          # A read-only reference to a single tool, tool set, or sub-agent attached to a
          # variation. Read the full set of assignments via
          # `AgentVariationInfo.assignments`; mutations go through the dedicated add/remove
          # assignment endpoints.
          #
          # The `id` identifies the assignment itself (not the referenced resource) and is
          # the handle used to remove the assignment. It is returned by the add endpoint and
          # present on every entry in `AgentVariationInfo.assignments`.
          resource: nil
        )
        end

        sig do
          override.returns(
            {
              action:
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Action::TaggedSymbol,
              error:
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Error,
              resource: Cadenya::Agents::VariationAssignment
            }
          )
        end
        def to_hash
        end

        module Action
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Action
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTION_UNSPECIFIED =
            T.let(
              :ACTION_UNSPECIFIED,
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Action::TaggedSymbol
            )
          ACTION_CREATED =
            T.let(
              :ACTION_CREATED,
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Action::TaggedSymbol
            )
          ACTION_UPDATED =
            T.let(
              :ACTION_UPDATED,
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Action::TaggedSymbol
            )
          ACTION_UNCHANGED =
            T.let(
              :ACTION_UNCHANGED,
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Action::TaggedSymbol
            )
          ACTION_DELETED =
            T.let(
              :ACTION_DELETED,
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Action::TaggedSymbol
            )
          ACTION_FAILED =
            T.let(
              :ACTION_FAILED,
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Action::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Action::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Error < Cadenya::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Error,
                Cadenya::Internal::AnyHash
              )
            end

          # The status code, which should be an enum value of
          # [google.rpc.Code][google.rpc.Code].
          sig { returns(T.nilable(Integer)) }
          attr_reader :code

          sig { params(code: Integer).void }
          attr_writer :code

          # A list of messages that carry the error details. There is a common set of
          # message types for APIs to use.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Error::Detail
                ]
              )
            )
          end
          attr_reader :details

          sig do
            params(
              details:
                T::Array[
                  Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Error::Detail::OrHash
                ]
            ).void
          end
          attr_writer :details

          # A developer-facing error message, which should be in English. Any user-facing
          # error message should be localized and sent in the
          # [google.rpc.Status.details][google.rpc.Status.details] field, or localized by
          # the client.
          sig { returns(T.nilable(String)) }
          attr_reader :message

          sig { params(message: String).void }
          attr_writer :message

          # The `Status` type defines a logical error model that is suitable for different
          # programming environments, including REST APIs and RPC APIs. It is used by
          # [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of
          # data: error code, error message, and error details. You can find out more about
          # this error model and how to work with it in the
          # [API Design Guide](https://cloud.google.com/apis/design/errors).
          sig do
            params(
              code: Integer,
              details:
                T::Array[
                  Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Error::Detail::OrHash
                ],
              message: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The status code, which should be an enum value of
            # [google.rpc.Code][google.rpc.Code].
            code: nil,
            # A list of messages that carry the error details. There is a common set of
            # message types for APIs to use.
            details: nil,
            # A developer-facing error message, which should be in English. Any user-facing
            # error message should be localized and sent in the
            # [google.rpc.Status.details][google.rpc.Status.details] field, or localized by
            # the client.
            message: nil
          )
          end

          sig do
            override.returns(
              {
                code: Integer,
                details:
                  T::Array[
                    Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Error::Detail
                  ],
                message: String
              }
            )
          end
          def to_hash
          end

          class Detail < Cadenya::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataVariationAssignmentOutcome::Error::Detail,
                  Cadenya::Internal::AnyHash
                )
              end

            # The type of the serialized message.
            sig { returns(T.nilable(String)) }
            attr_reader :type

            sig { params(type: String).void }
            attr_writer :type

            # Contains an arbitrary serialized message along with a @type that describes the
            # type of the serialized message.
            sig { params(type: String).returns(T.attached_class) }
            def self.new(
              # The type of the serialized message.
              type: nil
            )
            end

            sig { override.returns({ type: String }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
