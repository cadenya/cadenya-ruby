# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataSubAgentSpawned < Cadenya::Internal::Type::BaseModel
      # @!attribute sub_agent_spawned
      #
      #   @return [Cadenya::Models::SubAgentSpawned]
      required :sub_agent_spawned, -> { Cadenya::SubAgentSpawned }, api_name: :subAgentSpawned

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataSubAgentSpawned::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataSubAgentSpawned::Type }

      # @!method initialize(sub_agent_spawned:, type:)
      #   @param sub_agent_spawned [Cadenya::Models::SubAgentSpawned]
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataSubAgentSpawned::Type]

      # @see Cadenya::Models::ObjectiveEventDataSubAgentSpawned#type
      module Type
        extend Cadenya::Internal::Type::Enum

        SUB_AGENT_SPAWNED = :subAgentSpawned

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
