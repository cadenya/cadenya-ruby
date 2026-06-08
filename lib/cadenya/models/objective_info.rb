# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveInfo < Cadenya::Internal::Type::BaseModel
      # @!attribute created_by
      #   A profile identifies a user or non-human principal (such as an API key) at the
      #   account level. Profiles are account-scoped and can be granted access to multiple
      #   workspaces.
      #
      #   @return [Cadenya::Models::Profile]
      required :created_by, -> { Cadenya::Profile }, api_name: :createdBy

      response_only do
        # @!attribute agent
        #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @return [Cadenya::Models::ResourceMetadata]
        required :agent, -> { Cadenya::ResourceMetadata }

        # @!attribute agent_variation
        #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @return [Cadenya::Models::ResourceMetadata]
        required :agent_variation, -> { Cadenya::ResourceMetadata }, api_name: :agentVariation

        # @!attribute current_context_window_id
        #   ID of the objective's current (most recent) context window. Hydrated on demand;
        #   empty when the objective has not yet produced a context window.
        #
        #   @return [String]
        required :current_context_window_id, String, api_name: :currentContextWindowId

        # @!attribute effective_memory_stack
        #   The effective memory stack at objective creation time, flattened from the
        #   variation's baseline plus Objective.memory_stack. Order is push order (last =
        #   top). Returned on reads so clients can see exactly what stack the objective is
        #   using without having to re-join variation state.
        #
        #   @return [Array<Cadenya::Models::MemoryReference>]
        required :effective_memory_stack,
                 -> { Cadenya::Internal::Type::ArrayOf[Cadenya::MemoryReference] },
                 api_name: :effectiveMemoryStack

        # @!attribute total_context_windows
        #   Total number of context windows that this objective has generated
        #
        #   @return [Integer]
        required :total_context_windows, Integer, api_name: :totalContextWindows

        # @!attribute total_events
        #   Total number of events generated during this objective's execution
        #
        #   @return [Integer]
        required :total_events, Integer, api_name: :totalEvents

        # @!attribute total_input_tokens
        #   Total input tokens consumed across all LLM completions across all context
        #   windows
        #
        #   @return [Integer]
        required :total_input_tokens, Integer, api_name: :totalInputTokens

        # @!attribute total_iterations
        #
        #   @return [Integer]
        required :total_iterations, Integer, api_name: :totalIterations

        # @!attribute total_output_tokens
        #   Total output tokens generated across all LLM completions across all context
        #   windows
        #
        #   @return [Integer]
        required :total_output_tokens, Integer, api_name: :totalOutputTokens

        # @!attribute total_tool_calls
        #   Total number of tool calls made during execution
        #
        #   @return [Integer]
        required :total_tool_calls, Integer, api_name: :totalToolCalls
      end

      # @!method initialize(agent:, agent_variation:, created_by:, current_context_window_id:, effective_memory_stack:, total_context_windows:, total_events:, total_input_tokens:, total_iterations:, total_output_tokens:, total_tool_calls:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveInfo} for more details.
      #
      #   ObjectiveInfo provides read-only aggregated statistics about an objective's
      #   execution
      #
      #   @param agent [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param agent_variation [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
      #
      #   @param current_context_window_id [String] ID of the objective's current (most recent) context window. Hydrated on
      #
      #   @param effective_memory_stack [Array<Cadenya::Models::MemoryReference>] The effective memory stack at objective creation time, flattened
      #
      #   @param total_context_windows [Integer] Total number of context windows that this objective has generated
      #
      #   @param total_events [Integer] Total number of events generated during this objective's execution
      #
      #   @param total_input_tokens [Integer] Total input tokens consumed across all LLM completions across all context window
      #
      #   @param total_iterations [Integer]
      #
      #   @param total_output_tokens [Integer] Total output tokens generated across all LLM completions across all context wind
      #
      #   @param total_tool_calls [Integer] Total number of tool calls made during execution
    end
  end
end
