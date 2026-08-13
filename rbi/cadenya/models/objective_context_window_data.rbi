# typed: strong

module Cadenya
  module Models
    class ObjectiveContextWindowData < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveContextWindowData, Cadenya::Internal::AnyHash)
        end

      # The instructions for this window to continue from a previous window's chat
      # history.
      sig { returns(String) }
      attr_accessor :previous_window_continue_instructions

      # A calculated value for how many completion tokens (output tokens) have been used
      # in this context window
      sig { returns(Integer) }
      attr_accessor :completion_tokens

      # The objective's ID that this window belongs to
      sig { returns(String) }
      attr_accessor :objective_id

      # A calculated value for how many prompt tokens (input tokens) have been used in
      # this context window
      sig { returns(Integer) }
      attr_accessor :prompt_tokens

      # sequence is a numeric representation of which context window this is. Sequences
      # are useful to perform a max(sequence) on in order to calculate how many context
      # windows an objective has.
      sig { returns(Integer) }
      attr_accessor :sequence

      sig do
        params(
          completion_tokens: Integer,
          objective_id: String,
          previous_window_continue_instructions: String,
          prompt_tokens: Integer,
          sequence: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # A calculated value for how many completion tokens (output tokens) have been used
        # in this context window
        completion_tokens:,
        # The objective's ID that this window belongs to
        objective_id:,
        # The instructions for this window to continue from a previous window's chat
        # history.
        previous_window_continue_instructions:,
        # A calculated value for how many prompt tokens (input tokens) have been used in
        # this context window
        prompt_tokens:,
        # sequence is a numeric representation of which context window this is. Sequences
        # are useful to perform a max(sequence) on in order to calculate how many context
        # windows an objective has.
        sequence:
      )
      end

      sig do
        override.returns(
          {
            completion_tokens: Integer,
            objective_id: String,
            previous_window_continue_instructions: String,
            prompt_tokens: Integer,
            sequence: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
