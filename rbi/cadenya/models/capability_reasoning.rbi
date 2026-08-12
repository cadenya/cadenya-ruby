# typed: strong

module Cadenya
  module Models
    class CapabilityReasoning < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::CapabilityReasoning, Cadenya::Internal::AnyHash)
        end

      # How reasoning is enabled for this model. Catalog data used to decide whether
      # thinking is requested for objective iterations on this model.
      sig do
        returns(T.nilable(Cadenya::CapabilityReasoning::Mode::TaggedSymbol))
      end
      attr_reader :mode

      sig { params(mode: Cadenya::CapabilityReasoning::Mode::OrSymbol).void }
      attr_writer :mode

      # Reasoning / extended thinking (ModelConfig.reasoning_effort). A model that does
      # not reason simply omits this capability.
      sig do
        params(mode: Cadenya::CapabilityReasoning::Mode::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(
        # How reasoning is enabled for this model. Catalog data used to decide whether
        # thinking is requested for objective iterations on this model.
        mode: nil
      )
      end

      sig do
        override.returns(
          { mode: Cadenya::CapabilityReasoning::Mode::TaggedSymbol }
        )
      end
      def to_hash
      end

      # How reasoning is enabled for this model. Catalog data used to decide whether
      # thinking is requested for objective iterations on this model.
      module Mode
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::CapabilityReasoning::Mode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MODE_UNSPECIFIED =
          T.let(
            :MODE_UNSPECIFIED,
            Cadenya::CapabilityReasoning::Mode::TaggedSymbol
          )
        MODE_ADAPTIVE =
          T.let(
            :MODE_ADAPTIVE,
            Cadenya::CapabilityReasoning::Mode::TaggedSymbol
          )
        MODE_BUDGET =
          T.let(:MODE_BUDGET, Cadenya::CapabilityReasoning::Mode::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::CapabilityReasoning::Mode::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
