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

      sig { returns(String) }
      attr_accessor :workspace_id

      sig { returns(String) }
      attr_accessor :objective_id

      # When set to true, the message will be enqueued for when the agent loop is
      # available to process it.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enqueue

      sig { params(enqueue: T::Boolean).void }
      attr_writer :enqueue

      # The message to continue an objective that has completed (or you are enqueing)
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      # Secrets that should be included with the message. Helpful for when you need to
      # update secrets on the objective (IE: A secret expires and needs to be refreshed)
      sig do
        returns(T.nilable(T::Array[Cadenya::ObjectiveContinueParams::Secret]))
      end
      attr_reader :secrets

      sig do
        params(
          secrets: T::Array[Cadenya::ObjectiveContinueParams::Secret::OrHash]
        ).void
      end
      attr_writer :secrets

      sig do
        params(
          workspace_id: String,
          objective_id: String,
          enqueue: T::Boolean,
          message: String,
          secrets: T::Array[Cadenya::ObjectiveContinueParams::Secret::OrHash],
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        workspace_id:,
        objective_id:,
        # When set to true, the message will be enqueued for when the agent loop is
        # available to process it.
        enqueue: nil,
        # The message to continue an objective that has completed (or you are enqueing)
        message: nil,
        # Secrets that should be included with the message. Helpful for when you need to
        # update secrets on the objective (IE: A secret expires and needs to be refreshed)
        secrets: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            objective_id: String,
            enqueue: T::Boolean,
            message: String,
            secrets: T::Array[Cadenya::ObjectiveContinueParams::Secret],
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Secret < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ObjectiveContinueParams::Secret,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { returns(T.nilable(String)) }
        attr_reader :value

        sig { params(value: String).void }
        attr_writer :value

        sig { params(name: String, value: String).returns(T.attached_class) }
        def self.new(name: nil, value: nil)
        end

        sig { override.returns({ name: String, value: String }) }
        def to_hash
        end
      end
    end
  end
end
