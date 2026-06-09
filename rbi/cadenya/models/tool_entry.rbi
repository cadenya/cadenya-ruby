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

      # Desired lifecycle state for the tool. Defaults to STATE_AVAILABLE when
      # unspecified. STATE_ARCHIVED is server-managed and is rejected here.
      sig { returns(T.nilable(Cadenya::ToolEntry::State::OrSymbol)) }
      attr_reader :state

      sig { params(state: Cadenya::ToolEntry::State::OrSymbol).void }
      attr_writer :state

      sig do
        params(
          name: String,
          spec: Cadenya::ToolSets::ToolSpec::OrHash,
          labels: T::Hash[Symbol, String],
          state: Cadenya::ToolEntry::State::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        name:,
        spec:,
        labels: nil,
        # Desired lifecycle state for the tool. Defaults to STATE_AVAILABLE when
        # unspecified. STATE_ARCHIVED is server-managed and is rejected here.
        state: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            spec: Cadenya::ToolSets::ToolSpec,
            labels: T::Hash[Symbol, String],
            state: Cadenya::ToolEntry::State::OrSymbol
          }
        )
      end
      def to_hash
      end

      # Desired lifecycle state for the tool. Defaults to STATE_AVAILABLE when
      # unspecified. STATE_ARCHIVED is server-managed and is rejected here.
      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Cadenya::ToolEntry::State) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(:STATE_UNSPECIFIED, Cadenya::ToolEntry::State::TaggedSymbol)
        STATE_AVAILABLE =
          T.let(:STATE_AVAILABLE, Cadenya::ToolEntry::State::TaggedSymbol)
        STATE_OMITTED =
          T.let(:STATE_OMITTED, Cadenya::ToolEntry::State::TaggedSymbol)
        STATE_ARCHIVED =
          T.let(:STATE_ARCHIVED, Cadenya::ToolEntry::State::TaggedSymbol)

        sig do
          override.returns(T::Array[Cadenya::ToolEntry::State::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
