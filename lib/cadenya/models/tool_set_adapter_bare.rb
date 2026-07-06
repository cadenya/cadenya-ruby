# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetAdapterBare < Cadenya::Internal::Type::BaseModel
      # @!attribute content_timeout
      #   How long to wait for content to be set before the tool call errors. If unset,
      #   the call waits indefinitely.
      #
      #   @return [Integer, nil]
      optional :content_timeout, Integer, api_name: :contentTimeout

      # @!method initialize(content_timeout: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolSetAdapterBare} for more details.
      #
      #   Bare tool sets define tools without an execution adapter. A bare tool call
      #   doesn't fire anything: the objective's workflow pauses and waits for an external
      #   API consumer to set the tool call's content (e.g. human-in-the-loop tools, or a
      #   reverse harness that polls for pending tool calls, executes locally, and reports
      #   results back via SetToolCallContent).
      #
      #   @param content_timeout [Integer] How long to wait for content to be set before the tool call errors.
    end
  end
end
