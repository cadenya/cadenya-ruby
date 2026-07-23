# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataSubAgentSpawned < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveEventDataSubAgentSpawned,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(Cadenya::SubAgentSpawned) }
      attr_reader :sub_agent_spawned

      sig { params(sub_agent_spawned: Cadenya::SubAgentSpawned::OrHash).void }
      attr_writer :sub_agent_spawned

      sig do
        returns(Cadenya::ObjectiveEventDataSubAgentSpawned::Type::TaggedSymbol)
      end
      attr_accessor :type

      sig do
        params(
          sub_agent_spawned: Cadenya::SubAgentSpawned::OrHash,
          type: Cadenya::ObjectiveEventDataSubAgentSpawned::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(sub_agent_spawned:, type:)
      end

      sig do
        override.returns(
          {
            sub_agent_spawned: Cadenya::SubAgentSpawned,
            type: Cadenya::ObjectiveEventDataSubAgentSpawned::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ObjectiveEventDataSubAgentSpawned::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SUB_AGENT_SPAWNED =
          T.let(
            :subAgentSpawned,
            Cadenya::ObjectiveEventDataSubAgentSpawned::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Cadenya::ObjectiveEventDataSubAgentSpawned::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
