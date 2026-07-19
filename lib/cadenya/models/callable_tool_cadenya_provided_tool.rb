# frozen_string_literal: true

module Cadenya
  module Models
    class CallableToolCadenyaProvidedTool < Cadenya::Internal::Type::BaseModel
      # @!attribute cadenya_provided_tool
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata]
      required :cadenya_provided_tool, -> { Cadenya::ResourceMetadata }, api_name: :cadenyaProvidedTool

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::CallableToolCadenyaProvidedTool::Type]
      required :type, enum: -> { Cadenya::CallableToolCadenyaProvidedTool::Type }

      # @!method initialize(cadenya_provided_tool:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::CallableToolCadenyaProvidedTool} for more details.
      #
      #   @param cadenya_provided_tool [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param type [Symbol, Cadenya::Models::CallableToolCadenyaProvidedTool::Type]

      # @see Cadenya::Models::CallableToolCadenyaProvidedTool#type
      module Type
        extend Cadenya::Internal::Type::Enum

        CADENYA_PROVIDED_TOOL = :cadenyaProvidedTool

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
