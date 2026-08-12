# typed: strong

module Cadenya
  module Models
    class ModelSpecCapabilityTemperature < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ModelSpecCapabilityTemperature,
            Cadenya::Internal::AnyHash
          )
        end

      # Sampling temperature (ModelConfig.temperature).
      sig { returns(T.anything) }
      attr_accessor :temperature

      sig do
        returns(Cadenya::ModelSpecCapabilityTemperature::Type::TaggedSymbol)
      end
      attr_accessor :type

      sig do
        params(
          temperature: T.anything,
          type: Cadenya::ModelSpecCapabilityTemperature::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Sampling temperature (ModelConfig.temperature).
        temperature:,
        type:
      )
      end

      sig do
        override.returns(
          {
            temperature: T.anything,
            type: Cadenya::ModelSpecCapabilityTemperature::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ModelSpecCapabilityTemperature::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TEMPERATURE =
          T.let(
            :temperature,
            Cadenya::ModelSpecCapabilityTemperature::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Cadenya::ModelSpecCapabilityTemperature::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
