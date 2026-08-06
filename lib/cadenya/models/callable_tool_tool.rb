# frozen_string_literal: true

module Cadenya
  module Models
    class CallableToolTool < Cadenya::Internal::Type::BaseModel
      # @!attribute tool
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata]
      required :tool, -> { Cadenya::ResourceMetadata }

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::CallableToolTool::Type]
      required :type, enum: -> { Cadenya::CallableToolTool::Type }

      # @!method initialize(tool:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::CallableToolTool} for more details.
      #
      #   @param tool [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param type [Symbol, Cadenya::Models::CallableToolTool::Type]

      # @see Cadenya::Models::CallableToolTool#type
      module Type
        extend Cadenya::Internal::Type::Enum

        TOOL = :tool

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
