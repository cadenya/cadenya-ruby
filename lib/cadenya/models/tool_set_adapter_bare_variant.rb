# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetAdapterBareVariant < Cadenya::Internal::Type::BaseModel
      # @!attribute bare
      #   Bare tool sets define tools without an execution adapter. A bare tool call
      #   doesn't fire anything: the objective's workflow pauses and waits for an external
      #   API consumer to set the tool call's content (e.g. human-in-the-loop tools, or a
      #   reverse harness that polls for pending tool calls, executes locally, and reports
      #   results back via SetToolCallContent).
      #
      #   @return [Cadenya::Models::ToolSetAdapterBare]
      required :bare, -> { Cadenya::ToolSetAdapterBare }

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ToolSetAdapterBareVariant::Type]
      required :type, enum: -> { Cadenya::ToolSetAdapterBareVariant::Type }

      # @!method initialize(bare:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolSetAdapterBareVariant} for more details.
      #
      #   @param bare [Cadenya::Models::ToolSetAdapterBare] Bare tool sets define tools without an execution adapter. A bare tool
      #
      #   @param type [Symbol, Cadenya::Models::ToolSetAdapterBareVariant::Type]

      # @see Cadenya::Models::ToolSetAdapterBareVariant#type
      module Type
        extend Cadenya::Internal::Type::Enum

        BARE = :bare

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
