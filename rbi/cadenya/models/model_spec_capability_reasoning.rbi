# typed: strong

module Cadenya
  module Models
    class ModelSpecCapabilityReasoning < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ModelSpecCapabilityReasoning,
            Cadenya::Internal::AnyHash
          )
        end

      # Reasoning / extended thinking (ModelConfig.reasoning_effort). A model that does
      # not reason simply omits this capability.
      sig { returns(Cadenya::CapabilityReasoning) }
      attr_reader :reasoning

      sig { params(reasoning: Cadenya::CapabilityReasoning::OrHash).void }
      attr_writer :reasoning

      sig { returns(Cadenya::ModelSpecCapabilityReasoning::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          reasoning: Cadenya::CapabilityReasoning::OrHash,
          type: Cadenya::ModelSpecCapabilityReasoning::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Reasoning / extended thinking (ModelConfig.reasoning_effort). A model that does
        # not reason simply omits this capability.
        reasoning:,
        type:
      )
      end

      sig do
        override.returns(
          {
            reasoning: Cadenya::CapabilityReasoning,
            type: Cadenya::ModelSpecCapabilityReasoning::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ModelSpecCapabilityReasoning::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        REASONING =
          T.let(
            :reasoning,
            Cadenya::ModelSpecCapabilityReasoning::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ModelSpecCapabilityReasoning::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
