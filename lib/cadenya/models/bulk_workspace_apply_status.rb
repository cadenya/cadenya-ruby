# frozen_string_literal: true

module Cadenya
  module Models
    class BulkWorkspaceApplyStatus < Cadenya::Internal::Type::BaseModel
      # @!attribute state
      #
      #   @return [Symbol, Cadenya::Models::BulkWorkspaceApplyStatus::State]
      required :state, enum: -> { Cadenya::BulkWorkspaceApplyStatus::State }

      # @!attribute message
      #
      #   @return [String, nil]
      optional :message, String

      # @!attribute preflight_error
      #   The `Status` type defines a logical error model that is suitable for different
      #   programming environments, including REST APIs and RPC APIs. It is used by
      #   [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of
      #   data: error code, error message, and error details. You can find out more about
      #   this error model and how to work with it in the
      #   [API Design Guide](https://cloud.google.com/apis/design/errors).
      #
      #   @return [Cadenya::Models::BulkWorkspaceApplyStatus::PreflightError, nil]
      optional :preflight_error,
               -> { Cadenya::BulkWorkspaceApplyStatus::PreflightError },
               api_name: :preflightError

      # @!method initialize(state:, message: nil, preflight_error: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::BulkWorkspaceApplyStatus} for more details.
      #
      #   @param state [Symbol, Cadenya::Models::BulkWorkspaceApplyStatus::State]
      #
      #   @param message [String]
      #
      #   @param preflight_error [Cadenya::Models::BulkWorkspaceApplyStatus::PreflightError] The `Status` type defines a logical error model that is suitable for different p

      # @see Cadenya::Models::BulkWorkspaceApplyStatus#state
      module State
        extend Cadenya::Internal::Type::Enum

        STATE_UNSPECIFIED = :STATE_UNSPECIFIED
        STATE_PENDING = :STATE_PENDING
        STATE_VALIDATING = :STATE_VALIDATING
        STATE_RUNNING = :STATE_RUNNING
        STATE_SUCCEEDED = :STATE_SUCCEEDED
        STATE_PARTIALLY_APPLIED = :STATE_PARTIALLY_APPLIED
        STATE_FAILED = :STATE_FAILED
        STATE_CANCELLED = :STATE_CANCELLED

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Cadenya::Models::BulkWorkspaceApplyStatus#preflight_error
      class PreflightError < Cadenya::Internal::Type::BaseModel
        # @!attribute code
        #   The status code, which should be an enum value of
        #   [google.rpc.Code][google.rpc.Code].
        #
        #   @return [Integer, nil]
        optional :code, Integer

        # @!attribute details
        #   A list of messages that carry the error details. There is a common set of
        #   message types for APIs to use.
        #
        #   @return [Array<Cadenya::Models::BulkWorkspaceApplyStatus::PreflightError::Detail>, nil]
        optional :details,
                 -> { Cadenya::Internal::Type::ArrayOf[Cadenya::BulkWorkspaceApplyStatus::PreflightError::Detail] }

        # @!attribute message
        #   A developer-facing error message, which should be in English. Any user-facing
        #   error message should be localized and sent in the
        #   [google.rpc.Status.details][google.rpc.Status.details] field, or localized by
        #   the client.
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(code: nil, details: nil, message: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::BulkWorkspaceApplyStatus::PreflightError} for more details.
        #
        #   The `Status` type defines a logical error model that is suitable for different
        #   programming environments, including REST APIs and RPC APIs. It is used by
        #   [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of
        #   data: error code, error message, and error details. You can find out more about
        #   this error model and how to work with it in the
        #   [API Design Guide](https://cloud.google.com/apis/design/errors).
        #
        #   @param code [Integer] The status code, which should be an enum value of [google.rpc.Code]google.rpc.C
        #
        #   @param details [Array<Cadenya::Models::BulkWorkspaceApplyStatus::PreflightError::Detail>] A list of messages that carry the error details. There is a common set of messa
        #
        #   @param message [String] A developer-facing error message, which should be in English. Any user-facing er

        class Detail < Cadenya::Internal::Type::BaseModel
          # @!attribute type
          #   The type of the serialized message.
          #
          #   @return [String, nil]
          optional :type, String, api_name: :@type

          # @!method initialize(type: nil)
          #   Contains an arbitrary serialized message along with a @type that describes the
          #   type of the serialized message.
          #
          #   @param type [String] The type of the serialized message.
        end
      end
    end
  end
end
