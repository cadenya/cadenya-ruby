# frozen_string_literal: true

module Cadenya
  module Models
    class CallableToolAgent < Cadenya::Internal::Type::BaseModel
      # @!attribute agent
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata]
      required :agent, -> { Cadenya::ResourceMetadata }

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::CallableToolAgent::Type]
      required :type, enum: -> { Cadenya::CallableToolAgent::Type }

      # @!method initialize(agent:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::CallableToolAgent} for more details.
      #
      #   @param agent [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param type [Symbol, Cadenya::Models::CallableToolAgent::Type]

      # @see Cadenya::Models::CallableToolAgent#type
      module Type
        extend Cadenya::Internal::Type::Enum

        AGENT = :agent

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
