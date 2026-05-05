# frozen_string_literal: true

module Cadenya
  module Models
    class SyncFailed < Cadenya::Internal::Type::BaseModel
      # @!attribute error
      #   Indicates this is an error event.
      #
      #   @return [Boolean, nil]
      optional :error, Cadenya::Internal::Type::Boolean

      # @!attribute error_type
      #   Optional error type/code for programmatic handling.
      #
      #   @return [String, nil]
      optional :error_type, String, api_name: :errorType

      # @!attribute message
      #   Error message describing what went wrong.
      #
      #   @return [String, nil]
      optional :message, String

      # @!method initialize(error: nil, error_type: nil, message: nil)
      #   Emitted when a tool set sync operation fails.
      #
      #   @param error [Boolean] Indicates this is an error event.
      #
      #   @param error_type [String] Optional error type/code for programmatic handling.
      #
      #   @param message [String] Error message describing what went wrong.
    end
  end
end
