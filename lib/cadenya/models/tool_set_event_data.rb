# frozen_string_literal: true

module Cadenya
  module Models
    # Event payload for a tool set operation.
    module ToolSetEventData
      extend Cadenya::Internal::Type::Union

      discriminator :type

      variant :syncStarted, -> { Cadenya::ToolSetEventDataSyncStarted }

      variant :syncCompleted, -> { Cadenya::ToolSetEventDataSyncCompleted }

      variant :syncFailed, -> { Cadenya::ToolSetEventDataSyncFailed }

      # @!method self.variants
      #   @return [Array(Cadenya::Models::ToolSetEventDataSyncStarted, Cadenya::Models::ToolSetEventDataSyncCompleted, Cadenya::Models::ToolSetEventDataSyncFailed)]
    end
  end
end
