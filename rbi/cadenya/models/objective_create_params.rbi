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

      sig { returns(T.nilable(String)) }
      attr_reader :workspace_id

      sig { params(workspace_id: String).void }
      attr_writer :workspace_id

      sig { returns(String) }
      attr_accessor :agent_id

      # Arbitrary data rendered into the selected variation's system_prompt_template
      # (liquid) to produce the objective's system prompt. If the agent has a
      # system_prompt_data_schema, this must satisfy it.
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :system_prompt_data

      # Episodic is used to configure the episodic memory for the objective
      sig { returns(T.nilable(Cadenya::ObjectiveCreateParams::EpisodicMemory)) }
      attr_reader :episodic_memory

      sig do
        params(
          episodic_memory:
            Cadenya::ObjectiveCreateParams::EpisodicMemory::OrHash
        ).void
      end
      attr_writer :episodic_memory

      # Optional explicit first user message for the LLM chat history. When not set, the
      # selected variation's first_user_message_template is rendered with
      # first_user_message_data instead. If neither this field nor a
      # first_user_message_template is present, the request is rejected with
      # InvalidArgument.
      sig { returns(T.nilable(String)) }
      attr_reader :first_user_message

      sig { params(first_user_message: String).void }
      attr_writer :first_user_message

      # Arbitrary data rendered into the selected variation's
      # first_user_message_template (liquid) to produce the first user message. Separate
      # from `system_prompt_data`, which renders the system prompt template.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :first_user_message_data

      sig { params(first_user_message_data: T::Hash[Symbol, T.anything]).void }
      attr_writer :first_user_message_data

      # Memory layers/entries layered over the baseline cascade inherited from the
      # selected variation — element-level rules over inherited styles, in CSS terms.
      #
      # Array order is resolution order: EARLIER elements are more specific and are
      # consulted first. Entries pinned via memory_entry_id behave as single-entry
      # layers at their position.
      #
      # System-managed layers (e.g., episodic) cannot be referenced here; they attach
      # themselves automatically based on the episodic key.
      #
      # Size cap: the TOTAL effective cascade (this field + the variation's memory layer
      # assignments) must not exceed 10 entries. A request that would produce a larger
      # cascade is rejected with InvalidArgument.
      sig { returns(T.nilable(T::Array[Cadenya::MemoryReference])) }
      attr_reader :memory_cascade

      sig do
        params(memory_cascade: T::Array[Cadenya::MemoryReference::OrHash]).void
      end
      attr_writer :memory_cascade

      # CreateOperationMetadata contains the user-provided fields for creating an
      # operation. Read-only fields (id, account_id, workspace_id, created_at,
      # profile_id) are excluded since they are set by the server.
      sig { returns(T.nilable(Cadenya::CreateOperationMetadata)) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::CreateOperationMetadata::OrHash).void }
      attr_writer :metadata

      # Parameters forced onto this objective's tool calls. A pinned parameter is an
      # overlay on a tool's JSON schema: the parameter is removed from what the LLM
      # sees, and its value is always overwritten server-side with the pinned value —
      # the model cannot choose a different value for it.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :pinned_parameters

      sig { params(pinned_parameters: T::Hash[Symbol, String]).void }
      attr_writer :pinned_parameters

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

      # SubjectAssertion identifies a person within a tenant in the customer's own
      # namespace — typically their user id. Asserting a subject upserts the subject
      # record under the asserted tenant and associates the created resource with it. A
      # subject assertion is only valid alongside a tenant assertion: subject
      # identifiers are scoped to their tenant.
      sig { returns(T.nilable(Cadenya::SubjectAssertion)) }
      attr_reader :subject

      sig { params(subject: Cadenya::SubjectAssertion::OrHash).void }
      attr_writer :subject

      # TenantAssertion identifies a tenant in the customer's own namespace — their org,
      # company, or team identifier for an end user. Asserting a tenant upserts the
      # tenant record in the workspace (keyed on `id` as the tenant's external_id) and
      # associates the created resource with it.
      sig { returns(T.nilable(Cadenya::TenantAssertion)) }
      attr_reader :tenant

      sig { params(tenant: Cadenya::TenantAssertion::OrHash).void }
      attr_writer :tenant

      # Optional explicit variation selection. Overrides the agent's
      # variation_selection_mode.
      sig { returns(T.nilable(String)) }
      attr_reader :variation_id

      sig { params(variation_id: String).void }
      attr_writer :variation_id

      sig do
        params(
          agent_id: String,
          system_prompt_data: T::Hash[Symbol, T.anything],
          workspace_id: String,
          episodic_memory:
            Cadenya::ObjectiveCreateParams::EpisodicMemory::OrHash,
          first_user_message: String,
          first_user_message_data: T::Hash[Symbol, T.anything],
          memory_cascade: T::Array[Cadenya::MemoryReference::OrHash],
          metadata: Cadenya::CreateOperationMetadata::OrHash,
          pinned_parameters: T::Hash[Symbol, String],
          secrets: T::Array[Cadenya::ObjectiveCreateParams::Secret::OrHash],
          subject: Cadenya::SubjectAssertion::OrHash,
          tenant: Cadenya::TenantAssertion::OrHash,
          variation_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        agent_id:,
        # Arbitrary data rendered into the selected variation's system_prompt_template
        # (liquid) to produce the objective's system prompt. If the agent has a
        # system_prompt_data_schema, this must satisfy it.
        system_prompt_data:,
        workspace_id: nil,
        # Episodic is used to configure the episodic memory for the objective
        episodic_memory: nil,
        # Optional explicit first user message for the LLM chat history. When not set, the
        # selected variation's first_user_message_template is rendered with
        # first_user_message_data instead. If neither this field nor a
        # first_user_message_template is present, the request is rejected with
        # InvalidArgument.
        first_user_message: nil,
        # Arbitrary data rendered into the selected variation's
        # first_user_message_template (liquid) to produce the first user message. Separate
        # from `system_prompt_data`, which renders the system prompt template.
        first_user_message_data: nil,
        # Memory layers/entries layered over the baseline cascade inherited from the
        # selected variation — element-level rules over inherited styles, in CSS terms.
        #
        # Array order is resolution order: EARLIER elements are more specific and are
        # consulted first. Entries pinned via memory_entry_id behave as single-entry
        # layers at their position.
        #
        # System-managed layers (e.g., episodic) cannot be referenced here; they attach
        # themselves automatically based on the episodic key.
        #
        # Size cap: the TOTAL effective cascade (this field + the variation's memory layer
        # assignments) must not exceed 10 entries. A request that would produce a larger
        # cascade is rejected with InvalidArgument.
        memory_cascade: nil,
        # CreateOperationMetadata contains the user-provided fields for creating an
        # operation. Read-only fields (id, account_id, workspace_id, created_at,
        # profile_id) are excluded since they are set by the server.
        metadata: nil,
        # Parameters forced onto this objective's tool calls. A pinned parameter is an
        # overlay on a tool's JSON schema: the parameter is removed from what the LLM
        # sees, and its value is always overwritten server-side with the pinned value —
        # the model cannot choose a different value for it.
        pinned_parameters: nil,
        # Secrets that can be used in the headers for tool calls using the secret
        # interpolation format.
        secrets: nil,
        # SubjectAssertion identifies a person within a tenant in the customer's own
        # namespace — typically their user id. Asserting a subject upserts the subject
        # record under the asserted tenant and associates the created resource with it. A
        # subject assertion is only valid alongside a tenant assertion: subject
        # identifiers are scoped to their tenant.
        subject: nil,
        # TenantAssertion identifies a tenant in the customer's own namespace — their org,
        # company, or team identifier for an end user. Asserting a tenant upserts the
        # tenant record in the workspace (keyed on `id` as the tenant's external_id) and
        # associates the created resource with it.
        tenant: nil,
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
            system_prompt_data: T::Hash[Symbol, T.anything],
            episodic_memory: Cadenya::ObjectiveCreateParams::EpisodicMemory,
            first_user_message: String,
            first_user_message_data: T::Hash[Symbol, T.anything],
            memory_cascade: T::Array[Cadenya::MemoryReference],
            metadata: Cadenya::CreateOperationMetadata,
            pinned_parameters: T::Hash[Symbol, String],
            secrets: T::Array[Cadenya::ObjectiveCreateParams::Secret],
            subject: Cadenya::SubjectAssertion,
            tenant: Cadenya::TenantAssertion,
            variation_id: String,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end

      class EpisodicMemory < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ObjectiveCreateParams::EpisodicMemory,
              Cadenya::Internal::AnyHash
            )
          end

        # The caller-supplied episodic key. Objectives created with the same key (for the
        # same agent) share one episodic memory layer.
        sig { returns(String) }
        attr_accessor :key

        # Episodic is used to configure the episodic memory for the objective
        sig { params(key: String).returns(T.attached_class) }
        def self.new(
          # The caller-supplied episodic key. Objectives created with the same key (for the
          # same agent) share one episodic memory layer.
          key:
        )
        end

        sig { override.returns({ key: String, memory_layer_id: String }) }
        def to_hash
        end
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
