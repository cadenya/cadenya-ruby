# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      class ToolSpec < Cadenya::Internal::Type::BaseModel
        # @!attribute config
        #   Config defines the adapter to use for the tool. This is used to determine how
        #   the tool is called. For example, if the tool is an HTTP tool, the adapter will
        #   be Http. If the tool is an inline tool, the adapter will be Inline.
        #
        #   @return [Cadenya::Models::ToolSets::ToolSpecConfig]
        required :config, -> { Cadenya::ToolSets::ToolSpecConfig }

        # @!attribute description
        #
        #   @return [String]
        required :description, String

        # @!attribute parameters
        #
        #   @return [Hash{Symbol=>Object}]
        required :parameters, Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]

        # @!attribute status
        #
        #   @return [Symbol, Cadenya::Models::ToolSets::ToolSpec::Status]
        required :status, enum: -> { Cadenya::ToolSets::ToolSpec::Status }

        # @!attribute requires_approval
        #
        #   @return [Boolean, nil]
        optional :requires_approval, Cadenya::Internal::Type::Boolean, api_name: :requiresApproval

        # @!method initialize(config:, description:, parameters:, status:, requires_approval: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ToolSets::ToolSpec} for more details.
        #
        #   @param config [Cadenya::Models::ToolSets::ToolSpecConfig] Config defines the adapter to use for the tool.
        #
        #   @param description [String]
        #
        #   @param parameters [Hash{Symbol=>Object}]
        #
        #   @param status [Symbol, Cadenya::Models::ToolSets::ToolSpec::Status]
        #
        #   @param requires_approval [Boolean]

        # @see Cadenya::Models::ToolSets::ToolSpec#status
        module Status
          extend Cadenya::Internal::Type::Enum

          TOOL_STATUS_UNSPECIFIED = :TOOL_STATUS_UNSPECIFIED
          TOOL_STATUS_AVAILABLE = :TOOL_STATUS_AVAILABLE
          TOOL_STATUS_OMITTED = :TOOL_STATUS_OMITTED
          TOOL_STATUS_ARCHIVED = :TOOL_STATUS_ARCHIVED

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
