# typed: strong

module Cadenya
  module Models
    class BulkWorkspaceApplyStatus < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::BulkWorkspaceApplyStatus, Cadenya::Internal::AnyHash)
        end

      sig { returns(Cadenya::BulkWorkspaceApplyStatus::State::TaggedSymbol) }
      attr_accessor :state

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
        returns(T.nilable(Cadenya::BulkWorkspaceApplyStatus::PreflightError))
      end
      attr_reader :preflight_error

      sig do
        params(
          preflight_error:
            Cadenya::BulkWorkspaceApplyStatus::PreflightError::OrHash
        ).void
      end
      attr_writer :preflight_error

      sig do
        params(
          state: Cadenya::BulkWorkspaceApplyStatus::State::OrSymbol,
          message: String,
          preflight_error:
            Cadenya::BulkWorkspaceApplyStatus::PreflightError::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        state:,
        message: nil,
        # The `Status` type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by
        # [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of
        # data: error code, error message, and error details. You can find out more about
        # this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        preflight_error: nil
      )
      end

      sig do
        override.returns(
          {
            state: Cadenya::BulkWorkspaceApplyStatus::State::TaggedSymbol,
            message: String,
            preflight_error: Cadenya::BulkWorkspaceApplyStatus::PreflightError
          }
        )
      end
      def to_hash
      end

      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::BulkWorkspaceApplyStatus::State)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(
            :STATE_UNSPECIFIED,
            Cadenya::BulkWorkspaceApplyStatus::State::TaggedSymbol
          )
        STATE_PENDING =
          T.let(
            :STATE_PENDING,
            Cadenya::BulkWorkspaceApplyStatus::State::TaggedSymbol
          )
        STATE_VALIDATING =
          T.let(
            :STATE_VALIDATING,
            Cadenya::BulkWorkspaceApplyStatus::State::TaggedSymbol
          )
        STATE_RUNNING =
          T.let(
            :STATE_RUNNING,
            Cadenya::BulkWorkspaceApplyStatus::State::TaggedSymbol
          )
        STATE_SUCCEEDED =
          T.let(
            :STATE_SUCCEEDED,
            Cadenya::BulkWorkspaceApplyStatus::State::TaggedSymbol
          )
        STATE_PARTIALLY_APPLIED =
          T.let(
            :STATE_PARTIALLY_APPLIED,
            Cadenya::BulkWorkspaceApplyStatus::State::TaggedSymbol
          )
        STATE_FAILED =
          T.let(
            :STATE_FAILED,
            Cadenya::BulkWorkspaceApplyStatus::State::TaggedSymbol
          )
        STATE_CANCELLED =
          T.let(
            :STATE_CANCELLED,
            Cadenya::BulkWorkspaceApplyStatus::State::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::BulkWorkspaceApplyStatus::State::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class PreflightError < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::BulkWorkspaceApplyStatus::PreflightError,
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
                Cadenya::BulkWorkspaceApplyStatus::PreflightError::Detail
              ]
            )
          )
        end
        attr_reader :details

        sig do
          params(
            details:
              T::Array[
                Cadenya::BulkWorkspaceApplyStatus::PreflightError::Detail::OrHash
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
                Cadenya::BulkWorkspaceApplyStatus::PreflightError::Detail::OrHash
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
                  Cadenya::BulkWorkspaceApplyStatus::PreflightError::Detail
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
                Cadenya::BulkWorkspaceApplyStatus::PreflightError::Detail,
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
