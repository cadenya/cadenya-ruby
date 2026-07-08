# frozen_string_literal: true

module Cadenya
  module Models
    class ContextLengths < Cadenya::Internal::Type::BaseModel
      response_only do
        # @!attribute assistant_messages
        #   Character length of the chat history messages with the assistant role.
        #
        #   @return [Integer]
        required :assistant_messages, Integer, api_name: :assistantMessages

        # @!attribute available_tools
        #   Character length of the discoverable/available-tools appendix attached to the
        #   system prompt.
        #
        #   @return [Integer]
        required :available_tools, Integer, api_name: :availableTools

        # @!attribute episodic_memory
        #   Character length of the episodic memory appendix attached to the system prompt.
        #
        #   @return [Integer]
        required :episodic_memory, Integer, api_name: :episodicMemory

        # @!attribute skills_memory
        #   Character length of the skills memory appendix attached to the system prompt.
        #
        #   @return [Integer]
        required :skills_memory, Integer, api_name: :skillsMemory

        # @!attribute system_prompt
        #   Character length of the objective's base system prompt (rendered variation
        #   template). Not tokens -- see the message comment.
        #
        #   @return [Integer]
        required :system_prompt, Integer, api_name: :systemPrompt

        # @!attribute tool_definitions
        #   Character length of the serialized tool definitions sent with the completion
        #   request (names, descriptions, and JSON-schema parameters).
        #
        #   @return [Integer]
        required :tool_definitions, Integer, api_name: :toolDefinitions

        # @!attribute tool_results
        #   Character length of the tool results present in the chat history.
        #
        #   @return [Integer]
        required :tool_results, Integer, api_name: :toolResults

        # @!attribute user_messages
        #   Character length of the chat history messages with the user role.
        #
        #   @return [Integer]
        required :user_messages, Integer, api_name: :userMessages
      end

      # @!method initialize(assistant_messages:, available_tools:, episodic_memory:, skills_memory:, system_prompt:, tool_definitions:, tool_results:, user_messages:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ContextLengths} for more details.
      #
      #   ContextLengths is the measured character length of each distinct component of an
      #   iteration's assembled context window. Values are raw character lengths of the
      #   component as assembled into the request — token estimates are derived by the
      #   client against input_tokens (component share = component length / sum of all
      #   lengths).
      #
      #   New components are added as new fields — wire-compatible; absent components read
      #   as 0.
      #
      #   @param assistant_messages [Integer] Character length of the chat history messages with the assistant role.
      #
      #   @param available_tools [Integer] Character length of the discoverable/available-tools appendix attached to the
      #
      #   @param episodic_memory [Integer] Character length of the episodic memory appendix attached to the system prompt.
      #
      #   @param skills_memory [Integer] Character length of the skills memory appendix attached to the system prompt.
      #
      #   @param system_prompt [Integer] Character length of the objective's base system prompt (rendered variation
      #
      #   @param tool_definitions [Integer] Character length of the serialized tool definitions sent with the completion
      #
      #   @param tool_results [Integer] Character length of the tool results present in the chat history.
      #
      #   @param user_messages [Integer] Character length of the chat history messages with the user role.
    end
  end
end
