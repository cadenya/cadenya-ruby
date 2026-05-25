# typed: strong

module Cadenya
  module Models
    class ToolFilter < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::ToolFilter, Cadenya::Internal::AnyHash) }

      sig { returns(Cadenya::ToolFilter::Operator::OrSymbol) }
      attr_accessor :operator

      sig { returns(T.nilable(T::Array[Cadenya::AttributeFilter])) }
      attr_reader :filters

      sig { params(filters: T::Array[Cadenya::AttributeFilter::OrHash]).void }
      attr_writer :filters

      # Top-level filter with simple boolean logic (no nesting)
      sig do
        params(
          operator: Cadenya::ToolFilter::Operator::OrSymbol,
          filters: T::Array[Cadenya::AttributeFilter::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(operator:, filters: nil)
      end

      sig do
        override.returns(
          {
            operator: Cadenya::ToolFilter::Operator::OrSymbol,
            filters: T::Array[Cadenya::AttributeFilter]
          }
        )
      end
      def to_hash
      end

      module Operator
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::ToolFilter::Operator) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPERATOR_UNSPECIFIED =
          T.let(
            :OPERATOR_UNSPECIFIED,
            Cadenya::ToolFilter::Operator::TaggedSymbol
          )
        OPERATOR_AND =
          T.let(:OPERATOR_AND, Cadenya::ToolFilter::Operator::TaggedSymbol)
        OPERATOR_OR =
          T.let(:OPERATOR_OR, Cadenya::ToolFilter::Operator::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::ToolFilter::Operator::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
