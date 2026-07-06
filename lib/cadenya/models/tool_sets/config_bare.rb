# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      class ConfigBare < Cadenya::Internal::Type::BaseModel
        # @!method initialize
        #   Marks the tool as bare: it has no execution adapter of its own and relies on the
        #   parent tool set being a Bare tool set. Present so a webhook consumer can tell a
        #   tool is bare from the tool data alone, without cross-referencing the tool set.
      end
    end
  end
end
