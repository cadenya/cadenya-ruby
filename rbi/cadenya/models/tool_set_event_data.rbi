# typed: strong

module Cadenya
  module Models
    # Event payload for a tool set operation.
    module ToolSetEventData
      extend Cadenya::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Cadenya::ToolSetEventDataSyncStarted,
            Cadenya::ToolSetEventDataSyncCompleted,
            Cadenya::ToolSetEventDataSyncFailed
          )
        end

      sig { override.returns(T::Array[Cadenya::ToolSetEventData::Variants]) }
      def self.variants
      end
    end
  end
end
