# frozen_string_literal: true

module Cadenya
  module Models
    module BulkWorkspaceResources
      class BulkWorkspaceApplyResultDataMemoryLayerOutcome < Cadenya::Internal::Type::BaseModel
        # @!attribute action
        #
        #   @return [Symbol, Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome::Action, nil]
        optional :action,
                 enum: -> { Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome::Action }

        # @!attribute error
        #   The `Status` type defines a logical error model that is suitable for different
        #   programming environments, including REST APIs and RPC APIs. It is used by
        #   [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of
        #   data: error code, error message, and error details. You can find out more about
        #   this error model and how to work with it in the
        #   [API Design Guide](https://cloud.google.com/apis/design/errors).
        #
        #   @return [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome::Error, nil]
        optional :error,
                 -> { Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome::Error }

        # @!attribute external_id
        #
        #   @return [String, nil]
        optional :external_id, String, api_name: :externalId

        # @!attribute resource
        #   MemoryLayer is a named container of memory entries that can be composed into an
        #   objective's memory stack. Layers are workspace-scoped resources. The layer type
        #   controls how its entries participate in the agent loop — see MemoryLayerType for
        #   details.
        #
        #   See "Memory stack composition" above for how layers compose at lookup time.
        #
        #   @return [Cadenya::Models::MemoryLayer, nil]
        optional :resource, -> { Cadenya::MemoryLayer }

        # @!method initialize(action: nil, error: nil, external_id: nil, resource: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome}
        #   for more details.
        #
        #   @param action [Symbol, Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome::Action]
        #
        #   @param error [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome::Error] The `Status` type defines a logical error model that is suitable for different p
        #
        #   @param external_id [String]
        #
        #   @param resource [Cadenya::Models::MemoryLayer] MemoryLayer is a named container of memory entries that can be composed into

        # @see Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome#action
        module Action
          extend Cadenya::Internal::Type::Enum

          ACTION_UNSPECIFIED = :ACTION_UNSPECIFIED
          ACTION_CREATED = :ACTION_CREATED
          ACTION_UPDATED = :ACTION_UPDATED
          ACTION_UNCHANGED = :ACTION_UNCHANGED
          ACTION_DELETED = :ACTION_DELETED
          ACTION_FAILED = :ACTION_FAILED

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome#error
        class Error < Cadenya::Internal::Type::BaseModel
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
          #   @return [Array<Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome::Error::Detail>, nil]
          optional :details,
                   -> { Cadenya::Internal::Type::ArrayOf[Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome::Error::Detail] }

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
          #   {Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome::Error}
          #   for more details.
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
          #   @param details [Array<Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultDataMemoryLayerOutcome::Error::Detail>] A list of messages that carry the error details. There is a common set of messa
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
end
