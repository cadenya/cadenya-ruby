# typed: strong

module Cadenya
  module Models
    class ContextLengths < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ContextLengths, Cadenya::Internal::AnyHash)
        end

      # Chat history messages with the assistant role.
      sig { returns(Integer) }
      attr_accessor :assistant_messages

      # The discoverable/available-tools appendix attached to the system prompt.
      sig { returns(Integer) }
      attr_accessor :available_tools

      # The episodic memory appendix attached to the system prompt.
      sig { returns(Integer) }
      attr_accessor :episodic_memory

      # The skills memory appendix attached to the system prompt.
      sig { returns(Integer) }
      attr_accessor :skills_memory

      # The objective's base system prompt (rendered variation template).
      sig { returns(Integer) }
      attr_accessor :system_prompt

      # Serialized tool definitions sent with the completion request (names,
      # descriptions, and JSON-schema parameters).
      sig { returns(Integer) }
      attr_accessor :tool_definitions

      # Tool results present in the chat history.
      sig { returns(Integer) }
      attr_accessor :tool_results

      # Chat history messages with the user role.
      sig { returns(Integer) }
      attr_accessor :user_messages

      # ContextLengths is the measured character length of each distinct component of an
      # iteration's assembled context window. Values are raw character lengths of the
      # component as assembled into the request — token estimates are derived by the
      # client against input_tokens (component share = component length / sum of all
      # lengths).
      #
      # New components are added as new fields — wire-compatible; absent components read
      # as 0.
      sig do
        params(
          assistant_messages: Integer,
          available_tools: Integer,
          episodic_memory: Integer,
          skills_memory: Integer,
          system_prompt: Integer,
          tool_definitions: Integer,
          tool_results: Integer,
          user_messages: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Chat history messages with the assistant role.
        assistant_messages:,
        # The discoverable/available-tools appendix attached to the system prompt.
        available_tools:,
        # The episodic memory appendix attached to the system prompt.
        episodic_memory:,
        # The skills memory appendix attached to the system prompt.
        skills_memory:,
        # The objective's base system prompt (rendered variation template).
        system_prompt:,
        # Serialized tool definitions sent with the completion request (names,
        # descriptions, and JSON-schema parameters).
        tool_definitions:,
        # Tool results present in the chat history.
        tool_results:,
        # Chat history messages with the user role.
        user_messages:
      )
      end

      sig do
        override.returns(
          {
            assistant_messages: Integer,
            available_tools: Integer,
            episodic_memory: Integer,
            skills_memory: Integer,
            system_prompt: Integer,
            tool_definitions: Integer,
            tool_results: Integer,
            user_messages: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
