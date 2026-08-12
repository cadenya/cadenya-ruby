# typed: strong

module Cadenya
  module Models
    class ModelSpecCapabilityTopK < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ModelSpecCapabilityTopK, Cadenya::Internal::AnyHash)
        end

      # Top-k sampling (ModelConfig.top_k).
      sig { returns(T.anything) }
      attr_accessor :top_k

      sig { returns(Cadenya::ModelSpecCapabilityTopK::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          top_k: T.anything,
          type: Cadenya::ModelSpecCapabilityTopK::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Top-k sampling (ModelConfig.top_k).
        top_k:,
        type:
      )
      end

      sig do
        override.returns(
          {
            top_k: T.anything,
            type: Cadenya::ModelSpecCapabilityTopK::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::ModelSpecCapabilityTopK::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TOP_K =
          T.let(:topK, Cadenya::ModelSpecCapabilityTopK::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::ModelSpecCapabilityTopK::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
