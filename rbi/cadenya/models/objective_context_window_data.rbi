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
      sig { returns(T.nilable(String)) }
      attr_reader :previous_window_continue_instructions

      sig { params(previous_window_continue_instructions: String).void }
      attr_writer :previous_window_continue_instructions

      # A calculated value for how many completion tokens (output tokens) have been used
      # in this context window
      sig { returns(T.nilable(Integer)) }
      attr_reader :completion_tokens

      sig { params(completion_tokens: Integer).void }
      attr_writer :completion_tokens

      # The objective's ID that this window belongs to
      sig { returns(T.nilable(String)) }
      attr_reader :objective_id

      sig { params(objective_id: String).void }
      attr_writer :objective_id

      # A calculated value for how many prompt tokens (input tokens) have been used in
      # this context window
      sig { returns(T.nilable(Integer)) }
      attr_reader :prompt_tokens

      sig { params(prompt_tokens: Integer).void }
      attr_writer :prompt_tokens

      # sequence is a numeric representation of which context window this is. Sequences
      # are useful to perform a max(sequence) on in order to calculate how many context
      # windows an objective has.
      sig { returns(T.nilable(Integer)) }
      attr_reader :sequence

      sig { params(sequence: Integer).void }
      attr_writer :sequence

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
        completion_tokens: nil,
        # The objective's ID that this window belongs to
        objective_id: nil,
        # The instructions for this window to continue from a previous window's chat
        # history.
        previous_window_continue_instructions: nil,
        # A calculated value for how many prompt tokens (input tokens) have been used in
        # this context window
        prompt_tokens: nil,
        # sequence is a numeric representation of which context window this is. Sequences
        # are useful to perform a max(sequence) on in order to calculate how many context
        # windows an objective has.
        sequence: nil
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
