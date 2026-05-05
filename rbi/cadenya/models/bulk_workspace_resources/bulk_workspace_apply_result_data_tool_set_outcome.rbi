# typed: strong

module Cadenya
  module Models
    module BulkWorkspaceResources
      class BulkWorkspaceApplyResultDataToolSetOutcome < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome,
              Cadenya::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Action::TaggedSymbol
            )
          )
        end
        attr_reader :action

        sig do
          params(
            action:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Action::OrSymbol
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
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Error
            )
          )
        end
        attr_reader :error

        sig do
          params(
            error:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Error::OrHash
          ).void
        end
        attr_writer :error

        sig { returns(T.nilable(String)) }
        attr_reader :external_id

        sig { params(external_id: String).void }
        attr_writer :external_id

        sig { returns(T.nilable(Cadenya::ToolSet)) }
        attr_reader :resource

        sig { params(resource: Cadenya::ToolSet::OrHash).void }
        attr_writer :resource

        sig do
          params(
            action:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Action::OrSymbol,
            error:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Error::OrHash,
            external_id: String,
            resource: Cadenya::ToolSet::OrHash
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
          external_id: nil,
          resource: nil
        )
        end

        sig do
          override.returns(
            {
              action:
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Action::TaggedSymbol,
              error:
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Error,
              external_id: String,
              resource: Cadenya::ToolSet
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
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Action
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTION_UNSPECIFIED =
            T.let(
              :ACTION_UNSPECIFIED,
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Action::TaggedSymbol
            )
          ACTION_CREATED =
            T.let(
              :ACTION_CREATED,
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Action::TaggedSymbol
            )
          ACTION_UPDATED =
            T.let(
              :ACTION_UPDATED,
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Action::TaggedSymbol
            )
          ACTION_UNCHANGED =
            T.let(
              :ACTION_UNCHANGED,
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Action::TaggedSymbol
            )
          ACTION_DELETED =
            T.let(
              :ACTION_DELETED,
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Action::TaggedSymbol
            )
          ACTION_FAILED =
            T.let(
              :ACTION_FAILED,
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Action::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Action::TaggedSymbol
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
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Error,
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
                  Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Error::Detail
                ]
              )
            )
          end
          attr_reader :details

          sig do
            params(
              details:
                T::Array[
                  Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Error::Detail::OrHash
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
                  Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Error::Detail::OrHash
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
                    Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Error::Detail
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
                  Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataToolSetOutcome::Error::Detail,
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
