# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataSubAgentUpdated < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveEventDataSubAgentUpdated,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(Cadenya::SubAgentUpdated) }
      attr_reader :sub_agent_updated

      sig { params(sub_agent_updated: Cadenya::SubAgentUpdated::OrHash).void }
      attr_writer :sub_agent_updated

      sig do
        returns(Cadenya::ObjectiveEventDataSubAgentUpdated::Type::TaggedSymbol)
      end
      attr_accessor :type

      sig do
        params(
          sub_agent_updated: Cadenya::SubAgentUpdated::OrHash,
          type: Cadenya::ObjectiveEventDataSubAgentUpdated::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(sub_agent_updated:, type:)
      end

      sig do
        override.returns(
          {
            sub_agent_updated: Cadenya::SubAgentUpdated,
            type: Cadenya::ObjectiveEventDataSubAgentUpdated::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ObjectiveEventDataSubAgentUpdated::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SUB_AGENT_UPDATED =
          T.let(
            :subAgentUpdated,
            Cadenya::ObjectiveEventDataSubAgentUpdated::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Cadenya::ObjectiveEventDataSubAgentUpdated::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
