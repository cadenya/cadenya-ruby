# typed: strong

module Cadenya
  module Models
    class ObjectiveCreateParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveCreateParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :workspace_id

      sig { returns(String) }
      attr_accessor :agent_id

      # Arbitrary data for the objective. May be used in liquid templates for prompts
      # configured on the agent variation
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :data

      # Optional override for initial message sent to the agent. This becomes the first
      # user message in the LLM chat history. The agent variation is used to set this if
      # not present.
      sig { returns(T.nilable(String)) }
      attr_reader :initial_message

      sig { params(initial_message: String).void }
      attr_writer :initial_message

      # Memory layers/entries to push onto this objective's memory stack on top of the
      # baseline stack inherited from the selected variation.
      #
      # Array order is push order: the first element sits lower in the objective's
      # contribution to the stack; the LAST element ends up on top of the effective
      # stack. Entries pinned via memory_entry_id behave as single-entry layers at their
      # position.
      #
      # System-managed layers (e.g., episodic) cannot be referenced here; they attach
      # themselves automatically based on episodic_key.
      #
      # Stack size cap: the TOTAL effective stack (variation's memory layers
      #
      # - this field) must not exceed 10 entries. A request that would produce an
      #   effective stack larger than 10 is rejected with InvalidArgument.
      sig { returns(T.nilable(T::Array[Cadenya::MemoryReference])) }
      attr_reader :memory_stack

      sig do
        params(memory_stack: T::Array[Cadenya::MemoryReference::OrHash]).void
      end
      attr_writer :memory_stack

      # CreateOperationMetadata contains the user-provided fields for creating an
      # operation. Read-only fields (id, account_id, workspace_id, created_at,
      # profile_id) are excluded since they are set by the server.
      sig { returns(T.nilable(Cadenya::CreateOperationMetadata)) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::CreateOperationMetadata::OrHash).void }
      attr_writer :metadata

      # Secrets that can be used in the headers for tool calls using the secret
      # interpolation format.
      sig do
        returns(T.nilable(T::Array[Cadenya::ObjectiveCreateParams::Secret]))
      end
      attr_reader :secrets

      sig do
        params(
          secrets: T::Array[Cadenya::ObjectiveCreateParams::Secret::OrHash]
        ).void
      end
      attr_writer :secrets

      # Optional explicit variation selection. Overrides the agent's
      # variation_selection_mode.
      sig { returns(T.nilable(String)) }
      attr_reader :variation_id

      sig { params(variation_id: String).void }
      attr_writer :variation_id

      sig do
        params(
          workspace_id: String,
          agent_id: String,
          data: T::Hash[Symbol, T.anything],
          initial_message: String,
          memory_stack: T::Array[Cadenya::MemoryReference::OrHash],
          metadata: Cadenya::CreateOperationMetadata::OrHash,
          secrets: T::Array[Cadenya::ObjectiveCreateParams::Secret::OrHash],
          variation_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        workspace_id:,
        agent_id:,
        # Arbitrary data for the objective. May be used in liquid templates for prompts
        # configured on the agent variation
        data:,
        # Optional override for initial message sent to the agent. This becomes the first
        # user message in the LLM chat history. The agent variation is used to set this if
        # not present.
        initial_message: nil,
        # Memory layers/entries to push onto this objective's memory stack on top of the
        # baseline stack inherited from the selected variation.
        #
        # Array order is push order: the first element sits lower in the objective's
        # contribution to the stack; the LAST element ends up on top of the effective
        # stack. Entries pinned via memory_entry_id behave as single-entry layers at their
        # position.
        #
        # System-managed layers (e.g., episodic) cannot be referenced here; they attach
        # themselves automatically based on episodic_key.
        #
        # Stack size cap: the TOTAL effective stack (variation's memory layers
        #
        # - this field) must not exceed 10 entries. A request that would produce an
        #   effective stack larger than 10 is rejected with InvalidArgument.
        memory_stack: nil,
        # CreateOperationMetadata contains the user-provided fields for creating an
        # operation. Read-only fields (id, account_id, workspace_id, created_at,
        # profile_id) are excluded since they are set by the server.
        metadata: nil,
        # Secrets that can be used in the headers for tool calls using the secret
        # interpolation format.
        secrets: nil,
        # Optional explicit variation selection. Overrides the agent's
        # variation_selection_mode.
        variation_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            agent_id: String,
            data: T::Hash[Symbol, T.anything],
            initial_message: String,
            memory_stack: T::Array[Cadenya::MemoryReference],
            metadata: Cadenya::CreateOperationMetadata,
            secrets: T::Array[Cadenya::ObjectiveCreateParams::Secret],
            variation_id: String,
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
              Cadenya::ObjectiveCreateParams::Secret,
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
