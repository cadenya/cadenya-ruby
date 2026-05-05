# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class ObjectiveToolCallData < Cadenya::Internal::Type::BaseModel
        # @!attribute callable
        #   CallableTool is a union that represents a tool that can be called by an agent.
        #   In Cadenya, a tool that is used within an agent objective might be a
        #   user-defined tool (IE: MCP, HTTP), another Agent (useful to separate context),
        #   or a Cadenya Tool (one Cadenya provides).
        #
        #   @return [Cadenya::Models::CallableTool]
        required :callable, -> { Cadenya::CallableTool }

        # @!attribute arguments
        #   The arguments passed to the tool
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :arguments, Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]

        # @!attribute memo
        #   A memo supplied by the reviewer when denying the tool call
        #
        #   @return [String, nil]
        optional :memo, String

        response_only do
          # @!attribute result
          #   The result content returned by the tool after execution
          #
          #   @return [String, nil]
          optional :result, String

          # @!attribute status_changed_by
          #   A profile identifies a user or non-human principal (such as an API key) at the
          #   account level. Profiles are account-scoped and can be granted access to multiple
          #   workspaces.
          #
          #   @return [Cadenya::Models::Profile, nil]
          optional :status_changed_by, -> { Cadenya::Profile }, api_name: :statusChangedBy
        end

        # @!method initialize(callable:, arguments: nil, memo: nil, result: nil, status_changed_by: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Objectives::ObjectiveToolCallData} for more details.
        #
        #   @param callable [Cadenya::Models::CallableTool] CallableTool is a union that represents a tool that can be called by an agent. I
        #
        #   @param arguments [Hash{Symbol=>Object}] The arguments passed to the tool
        #
        #   @param memo [String] A memo supplied by the reviewer when denying the tool call
        #
        #   @param result [String] The result content returned by the tool after execution
        #
        #   @param status_changed_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
      end
    end

    ObjectiveToolCallData = Objectives::ObjectiveToolCallData
  end
end
