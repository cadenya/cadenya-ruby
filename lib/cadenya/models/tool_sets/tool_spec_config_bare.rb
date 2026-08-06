# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      class ToolSpecConfigBare < Cadenya::Internal::Type::BaseModel
        # @!attribute bare
        #   Marks the tool as bare: it has no execution adapter of its own and relies on the
        #   parent tool set being a Bare tool set. Present so a webhook consumer can tell a
        #   tool is bare from the tool data alone, without cross-referencing the tool set.
        #
        #   @return [Cadenya::Models::ToolSets::ConfigBare]
        required :bare, -> { Cadenya::ToolSets::ConfigBare }

        # @!attribute type
        #
        #   @return [Symbol, Cadenya::Models::ToolSets::ToolSpecConfigBare::Type]
        required :type, enum: -> { Cadenya::ToolSets::ToolSpecConfigBare::Type }

        # @!method initialize(bare:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ToolSets::ToolSpecConfigBare} for more details.
        #
        #   @param bare [Cadenya::Models::ToolSets::ConfigBare] Marks the tool as bare: it has no execution adapter of its own and
        #
        #   @param type [Symbol, Cadenya::Models::ToolSets::ToolSpecConfigBare::Type]

        # @see Cadenya::Models::ToolSets::ToolSpecConfigBare#type
        module Type
          extend Cadenya::Internal::Type::Enum

          BARE = :bare

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
