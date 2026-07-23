# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataToolApprovalRequested < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveEventDataToolApprovalRequested,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(Cadenya::ToolApprovalRequested) }
      attr_reader :tool_approval_requested

      sig do
        params(
          tool_approval_requested: Cadenya::ToolApprovalRequested::OrHash
        ).void
      end
      attr_writer :tool_approval_requested

      sig do
        returns(
          Cadenya::ObjectiveEventDataToolApprovalRequested::Type::TaggedSymbol
        )
      end
      attr_accessor :type

      sig do
        params(
          tool_approval_requested: Cadenya::ToolApprovalRequested::OrHash,
          type: Cadenya::ObjectiveEventDataToolApprovalRequested::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(tool_approval_requested:, type:)
      end

      sig do
        override.returns(
          {
            tool_approval_requested: Cadenya::ToolApprovalRequested,
            type:
              Cadenya::ObjectiveEventDataToolApprovalRequested::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Cadenya::ObjectiveEventDataToolApprovalRequested::Type
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TOOL_APPROVAL_REQUESTED =
          T.let(
            :toolApprovalRequested,
            Cadenya::ObjectiveEventDataToolApprovalRequested::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Cadenya::ObjectiveEventDataToolApprovalRequested::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
