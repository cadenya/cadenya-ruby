# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataToolApproved < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveEventDataToolApproved,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(Cadenya::ToolApproved) }
      attr_reader :tool_approved

      sig { params(tool_approved: Cadenya::ToolApproved::OrHash).void }
      attr_writer :tool_approved

      sig do
        returns(Cadenya::ObjectiveEventDataToolApproved::Type::TaggedSymbol)
      end
      attr_accessor :type

      sig do
        params(
          tool_approved: Cadenya::ToolApproved::OrHash,
          type: Cadenya::ObjectiveEventDataToolApproved::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(tool_approved:, type:)
      end

      sig do
        override.returns(
          {
            tool_approved: Cadenya::ToolApproved,
            type: Cadenya::ObjectiveEventDataToolApproved::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ObjectiveEventDataToolApproved::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TOOL_APPROVED =
          T.let(
            :toolApproved,
            Cadenya::ObjectiveEventDataToolApproved::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Cadenya::ObjectiveEventDataToolApproved::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
