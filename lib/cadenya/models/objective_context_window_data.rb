# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveContextWindowData < Cadenya::Internal::Type::BaseModel
      # @!attribute previous_window_continue_instructions
      #   The instructions for this window to continue from a previous window's chat
      #   history.
      #
      #   @return [String, nil]
      optional :previous_window_continue_instructions, String, api_name: :previousWindowContinueInstructions

      response_only do
        # @!attribute completion_tokens
        #   A calculated value for how many completion tokens (output tokens) have been used
        #   in this context window
        #
        #   @return [Integer, nil]
        optional :completion_tokens, Integer, api_name: :completionTokens

        # @!attribute objective_id
        #   The objective's ID that this window belongs to
        #
        #   @return [String, nil]
        optional :objective_id, String, api_name: :objectiveId

        # @!attribute prompt_tokens
        #   A calculated value for how many prompt tokens (input tokens) have been used in
        #   this context window
        #
        #   @return [Integer, nil]
        optional :prompt_tokens, Integer, api_name: :promptTokens

        # @!attribute sequence
        #   sequence is a numeric representation of which context window this is. Sequences
        #   are useful to perform a max(sequence) on in order to calculate how many context
        #   windows an objective has.
        #
        #   @return [Integer, nil]
        optional :sequence, Integer
      end

      # @!method initialize(completion_tokens: nil, objective_id: nil, previous_window_continue_instructions: nil, prompt_tokens: nil, sequence: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveContextWindowData} for more details.
      #
      #   @param completion_tokens [Integer] A calculated value for how many completion tokens (output tokens) have been used
      #
      #   @param objective_id [String] The objective's ID that this window belongs to
      #
      #   @param previous_window_continue_instructions [String] The instructions for this window to continue from a previous window's chat histo
      #
      #   @param prompt_tokens [Integer] A calculated value for how many prompt tokens (input tokens) have been used in t
      #
      #   @param sequence [Integer] sequence is a numeric representation of which context window this is. Sequences
    end
  end
end
