# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataMemoryRead < Cadenya::Internal::Type::BaseModel
      # @!attribute memory_read
      #   MemoryRead is emitted each time the agent resolves a key against the memory
      #   cascade and loads an entry. Lookups that miss (key not found in any layer) do
      #   not emit this event.
      #
      #   @return [Cadenya::Models::MemoryRead]
      required :memory_read, -> { Cadenya::MemoryRead }, api_name: :memoryRead

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataMemoryRead::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataMemoryRead::Type }

      # @!method initialize(memory_read:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveEventDataMemoryRead} for more details.
      #
      #   @param memory_read [Cadenya::Models::MemoryRead] MemoryRead is emitted each time the agent resolves a key against the
      #
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataMemoryRead::Type]

      # @see Cadenya::Models::ObjectiveEventDataMemoryRead#type
      module Type
        extend Cadenya::Internal::Type::Enum

        MEMORY_READ = :memoryRead

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
