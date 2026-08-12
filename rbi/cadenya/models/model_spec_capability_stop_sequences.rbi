# typed: strong

module Cadenya
  module Models
    class ModelSpecCapabilityStopSequences < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ModelSpecCapabilityStopSequences,
            Cadenya::Internal::AnyHash
          )
        end

      # Custom stop sequences (ModelConfig.stop_sequences).
      sig { returns(Cadenya::CapabilityStopSequences) }
      attr_reader :stop_sequences

      sig do
        params(stop_sequences: Cadenya::CapabilityStopSequences::OrHash).void
      end
      attr_writer :stop_sequences

      sig do
        returns(Cadenya::ModelSpecCapabilityStopSequences::Type::TaggedSymbol)
      end
      attr_accessor :type

      sig do
        params(
          stop_sequences: Cadenya::CapabilityStopSequences::OrHash,
          type: Cadenya::ModelSpecCapabilityStopSequences::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Custom stop sequences (ModelConfig.stop_sequences).
        stop_sequences:,
        type:
      )
      end

      sig do
        override.returns(
          {
            stop_sequences: Cadenya::CapabilityStopSequences,
            type: Cadenya::ModelSpecCapabilityStopSequences::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ModelSpecCapabilityStopSequences::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STOP_SEQUENCES =
          T.let(
            :stopSequences,
            Cadenya::ModelSpecCapabilityStopSequences::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Cadenya::ModelSpecCapabilityStopSequences::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
