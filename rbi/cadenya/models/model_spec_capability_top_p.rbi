# typed: strong

module Cadenya
  module Models
    class ModelSpecCapabilityTopP < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ModelSpecCapabilityTopP, Cadenya::Internal::AnyHash)
        end

      # Nucleus sampling (ModelConfig.top_p).
      sig { returns(T.anything) }
      attr_accessor :top_p

      sig { returns(Cadenya::ModelSpecCapabilityTopP::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          top_p: T.anything,
          type: Cadenya::ModelSpecCapabilityTopP::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Nucleus sampling (ModelConfig.top_p).
        top_p:,
        type:
      )
      end

      sig do
        override.returns(
          {
            top_p: T.anything,
            type: Cadenya::ModelSpecCapabilityTopP::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::ModelSpecCapabilityTopP::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TOP_P =
          T.let(:topP, Cadenya::ModelSpecCapabilityTopP::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::ModelSpecCapabilityTopP::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
