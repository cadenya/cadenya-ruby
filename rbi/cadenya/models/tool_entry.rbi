# typed: strong

module Cadenya
  module Models
    class ToolEntry < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::ToolEntry, Cadenya::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :name

      sig { returns(Cadenya::ToolSets::ToolSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::ToolSets::ToolSpec::OrHash).void }
      attr_writer :spec

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      sig do
        params(
          name: String,
          spec: Cadenya::ToolSets::ToolSpec::OrHash,
          labels: T::Hash[Symbol, String]
        ).returns(T.attached_class)
      end
      def self.new(name:, spec:, labels: nil)
      end

      sig do
        override.returns(
          {
            name: String,
            spec: Cadenya::ToolSets::ToolSpec,
            labels: T::Hash[Symbol, String]
          }
        )
      end
      def to_hash
      end
    end
  end
end
