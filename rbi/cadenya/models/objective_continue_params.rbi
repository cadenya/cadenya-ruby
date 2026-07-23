# typed: strong

module Cadenya
  module Models
    class ObjectiveContinueParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveContinueParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :workspace_id

      sig { params(workspace_id: String).void }
      attr_writer :workspace_id

      sig { returns(String) }
      attr_accessor :objective_id

      # The message to continue an objective that has completed (or you are enqueing)
      sig { returns(String) }
      attr_accessor :message

      # When set to true, the message will be enqueued for when the agent loop is
      # available to process it.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enqueue

      sig { params(enqueue: T::Boolean).void }
      attr_writer :enqueue

      sig do
        params(
          objective_id: String,
          message: String,
          workspace_id: String,
          enqueue: T::Boolean,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        objective_id:,
        # The message to continue an objective that has completed (or you are enqueing)
        message:,
        workspace_id: nil,
        # When set to true, the message will be enqueued for when the agent loop is
        # available to process it.
        enqueue: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            objective_id: String,
            message: String,
            enqueue: T::Boolean,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
