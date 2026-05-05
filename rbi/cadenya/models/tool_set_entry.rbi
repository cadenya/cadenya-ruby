# typed: strong

module Cadenya
  module Models
    class ToolSetEntry < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetEntry, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :name

      sig { returns(Cadenya::ToolSetSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::ToolSetSpec::OrHash).void }
      attr_writer :spec

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      # Tools in this tool set, keyed by external_id.
      sig { returns(T.nilable(T::Hash[Symbol, Cadenya::ToolEntry])) }
      attr_reader :tools

      sig { params(tools: T::Hash[Symbol, Cadenya::ToolEntry::OrHash]).void }
      attr_writer :tools

      sig do
        params(
          name: String,
          spec: Cadenya::ToolSetSpec::OrHash,
          labels: T::Hash[Symbol, String],
          tools: T::Hash[Symbol, Cadenya::ToolEntry::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        name:,
        spec:,
        labels: nil,
        # Tools in this tool set, keyed by external_id.
        tools: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            spec: Cadenya::ToolSetSpec,
            labels: T::Hash[Symbol, String],
            tools: T::Hash[Symbol, Cadenya::ToolEntry]
          }
        )
      end
      def to_hash
      end
    end
  end
end
