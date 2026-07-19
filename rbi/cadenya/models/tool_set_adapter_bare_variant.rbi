# typed: strong

module Cadenya
  module Models
    class ToolSetAdapterBareVariant < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetAdapterBareVariant, Cadenya::Internal::AnyHash)
        end

      # Bare tool sets define tools without an execution adapter. A bare tool call
      # doesn't fire anything: the objective's workflow pauses and waits for an external
      # API consumer to set the tool call's content (e.g. human-in-the-loop tools, or a
      # reverse harness that polls for pending tool calls, executes locally, and reports
      # results back via SetToolCallContent).
      sig { returns(Cadenya::ToolSetAdapterBare) }
      attr_reader :bare

      sig { params(bare: Cadenya::ToolSetAdapterBare::OrHash).void }
      attr_writer :bare

      sig { returns(Cadenya::ToolSetAdapterBareVariant::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          bare: Cadenya::ToolSetAdapterBare::OrHash,
          type: Cadenya::ToolSetAdapterBareVariant::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Bare tool sets define tools without an execution adapter. A bare tool call
        # doesn't fire anything: the objective's workflow pauses and waits for an external
        # API consumer to set the tool call's content (e.g. human-in-the-loop tools, or a
        # reverse harness that polls for pending tool calls, executes locally, and reports
        # results back via SetToolCallContent).
        bare:,
        type:
      )
      end

      sig do
        override.returns(
          {
            bare: Cadenya::ToolSetAdapterBare,
            type: Cadenya::ToolSetAdapterBareVariant::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ToolSetAdapterBareVariant::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BARE =
          T.let(:bare, Cadenya::ToolSetAdapterBareVariant::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::ToolSetAdapterBareVariant::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
