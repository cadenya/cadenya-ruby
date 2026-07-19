# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataToolDenied < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveEventDataToolDenied,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(Cadenya::ToolDenied) }
      attr_reader :tool_denied

      sig { params(tool_denied: Cadenya::ToolDenied::OrHash).void }
      attr_writer :tool_denied

      sig { returns(Cadenya::ObjectiveEventDataToolDenied::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          tool_denied: Cadenya::ToolDenied::OrHash,
          type: Cadenya::ObjectiveEventDataToolDenied::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(tool_denied:, type:)
      end

      sig do
        override.returns(
          {
            tool_denied: Cadenya::ToolDenied,
            type: Cadenya::ObjectiveEventDataToolDenied::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ObjectiveEventDataToolDenied::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TOOL_DENIED =
          T.let(
            :toolDenied,
            Cadenya::ObjectiveEventDataToolDenied::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ObjectiveEventDataToolDenied::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
