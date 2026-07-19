# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataSubAgentUpdated < Cadenya::Internal::Type::BaseModel
      # @!attribute sub_agent_updated
      #
      #   @return [Cadenya::Models::SubAgentUpdated]
      required :sub_agent_updated, -> { Cadenya::SubAgentUpdated }, api_name: :subAgentUpdated

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataSubAgentUpdated::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataSubAgentUpdated::Type }

      # @!method initialize(sub_agent_updated:, type:)
      #   @param sub_agent_updated [Cadenya::Models::SubAgentUpdated]
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataSubAgentUpdated::Type]

      # @see Cadenya::Models::ObjectiveEventDataSubAgentUpdated#type
      module Type
        extend Cadenya::Internal::Type::Enum

        SUB_AGENT_UPDATED = :subAgentUpdated

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
