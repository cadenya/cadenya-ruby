# typed: strong

module Cadenya
  module Models
    class AgentSpec < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::AgentSpec, Cadenya::Internal::AnyHash) }

      # Controls how variations are automatically selected when creating objectives
      # Defaults to RANDOM when unspecified
      sig { returns(Cadenya::AgentSpec::VariationSelectionMode::OrSymbol) }
      attr_accessor :variation_selection_mode

      # Description of the agent's purpose
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Enable episodic memory for objectives created for this agent. When true,
      # objective creation requires an episodic_memory key and the system finds or
      # creates a memory layer for that (agent, key) pair, letting the agent store and
      # retrieve memories across objectives that share the key. Memory is agent-level so
      # all variations of the agent share the same layers.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enable_episodic_memory

      sig { params(enable_episodic_memory: T::Boolean).void }
      attr_writer :enable_episodic_memory

      # How long episodic memories should be retained. Each new objective slides the
      # layer's expiry forward by this duration, and stored entries expire this long
      # after they are written. If not set, episodic memories are retained indefinitely.
      sig { returns(T.nilable(Integer)) }
      attr_reader :episodic_memory_ttl

      sig { params(episodic_memory_ttl: Integer).void }
      attr_writer :episodic_memory_ttl

      # Optional output definition for objectives created for this agent. When provided,
      # Cadenya will append a tool to that will be called by the LLM in use by the
      # variant to extract information in the format provided here. Use this option when
      # you want structured data to be created by your objectives.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :output_definition

      sig { params(output_definition: T::Hash[Symbol, T.anything]).void }
      attr_writer :output_definition

      # SystemPromptDataSchema enforces the shape of system_prompt_data when objectives
      # are created. This is valuable when using liquid formatting in agent variation
      # system prompt templates. The schema is also used when the agent is attached as a
      # sub-agent, as it becomes the tool's input parameter schema. If omitted, the
      # sub-agent schema will be loaded with a simple "prompt" free text string as its
      # schema.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :system_prompt_data_schema

      sig do
        params(system_prompt_data_schema: T::Hash[Symbol, T.anything]).void
      end
      attr_writer :system_prompt_data_schema

      # The URL that Cadenya will send events for any objective assigned to the agent.
      sig { returns(T.nilable(String)) }
      attr_reader :webhook_events_url

      sig { params(webhook_events_url: String).void }
      attr_writer :webhook_events_url

      # Agent specification (user-provided configuration)
      sig do
        params(
          variation_selection_mode:
            Cadenya::AgentSpec::VariationSelectionMode::OrSymbol,
          description: String,
          enable_episodic_memory: T::Boolean,
          episodic_memory_ttl: Integer,
          output_definition: T::Hash[Symbol, T.anything],
          system_prompt_data_schema: T::Hash[Symbol, T.anything],
          webhook_events_url: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Controls how variations are automatically selected when creating objectives
        # Defaults to RANDOM when unspecified
        variation_selection_mode:,
        # Description of the agent's purpose
        description: nil,
        # Enable episodic memory for objectives created for this agent. When true,
        # objective creation requires an episodic_memory key and the system finds or
        # creates a memory layer for that (agent, key) pair, letting the agent store and
        # retrieve memories across objectives that share the key. Memory is agent-level so
        # all variations of the agent share the same layers.
        enable_episodic_memory: nil,
        # How long episodic memories should be retained. Each new objective slides the
        # layer's expiry forward by this duration, and stored entries expire this long
        # after they are written. If not set, episodic memories are retained indefinitely.
        episodic_memory_ttl: nil,
        # Optional output definition for objectives created for this agent. When provided,
        # Cadenya will append a tool to that will be called by the LLM in use by the
        # variant to extract information in the format provided here. Use this option when
        # you want structured data to be created by your objectives.
        output_definition: nil,
        # SystemPromptDataSchema enforces the shape of system_prompt_data when objectives
        # are created. This is valuable when using liquid formatting in agent variation
        # system prompt templates. The schema is also used when the agent is attached as a
        # sub-agent, as it becomes the tool's input parameter schema. If omitted, the
        # sub-agent schema will be loaded with a simple "prompt" free text string as its
        # schema.
        system_prompt_data_schema: nil,
        # The URL that Cadenya will send events for any objective assigned to the agent.
        webhook_events_url: nil
      )
      end

      sig do
        override.returns(
          {
            variation_selection_mode:
              Cadenya::AgentSpec::VariationSelectionMode::OrSymbol,
            description: String,
            enable_episodic_memory: T::Boolean,
            episodic_memory_ttl: Integer,
            output_definition: T::Hash[Symbol, T.anything],
            system_prompt_data_schema: T::Hash[Symbol, T.anything],
            webhook_events_url: String
          }
        )
      end
      def to_hash
      end

      # Controls how variations are automatically selected when creating objectives
      # Defaults to RANDOM when unspecified
      module VariationSelectionMode
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::AgentSpec::VariationSelectionMode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        VARIATION_SELECTION_MODE_UNSPECIFIED =
          T.let(
            :VARIATION_SELECTION_MODE_UNSPECIFIED,
            Cadenya::AgentSpec::VariationSelectionMode::TaggedSymbol
          )
        VARIATION_SELECTION_MODE_RANDOM =
          T.let(
            :VARIATION_SELECTION_MODE_RANDOM,
            Cadenya::AgentSpec::VariationSelectionMode::TaggedSymbol
          )
        VARIATION_SELECTION_MODE_WEIGHTED =
          T.let(
            :VARIATION_SELECTION_MODE_WEIGHTED,
            Cadenya::AgentSpec::VariationSelectionMode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::AgentSpec::VariationSelectionMode::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
