# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataCancelled < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveEventDataCancelled,
            Cadenya::Internal::AnyHash
          )
        end

      # ObjectiveCancelled is the terminal event written when an objective is cancelled.
      # After this event, the objective is super-terminal: no further iterations,
      # compaction, or continuation are permitted.
      sig { returns(Cadenya::ObjectiveEventDataCancelled::Cancelled) }
      attr_reader :cancelled

      sig do
        params(
          cancelled: Cadenya::ObjectiveEventDataCancelled::Cancelled::OrHash
        ).void
      end
      attr_writer :cancelled

      sig { returns(Cadenya::ObjectiveEventDataCancelled::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          cancelled: Cadenya::ObjectiveEventDataCancelled::Cancelled::OrHash,
          type: Cadenya::ObjectiveEventDataCancelled::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # ObjectiveCancelled is the terminal event written when an objective is cancelled.
        # After this event, the objective is super-terminal: no further iterations,
        # compaction, or continuation are permitted.
        cancelled:,
        type:
      )
      end

      sig do
        override.returns(
          {
            cancelled: Cadenya::ObjectiveEventDataCancelled::Cancelled,
            type: Cadenya::ObjectiveEventDataCancelled::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Cancelled < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ObjectiveEventDataCancelled::Cancelled,
              Cadenya::Internal::AnyHash
            )
          end

        # Optional human-readable note recorded at cancel time. Today the workflow sets
        # "Cancelled" but this field leaves room for richer reasons (e.g. "Cancelled by
        # user", "Cancelled by schedule sweep", "Credit balance exhausted").
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # ObjectiveCancelled is the terminal event written when an objective is cancelled.
        # After this event, the objective is super-terminal: no further iterations,
        # compaction, or continuation are permitted.
        sig { params(message: String).returns(T.attached_class) }
        def self.new(
          # Optional human-readable note recorded at cancel time. Today the workflow sets
          # "Cancelled" but this field leaves room for richer reasons (e.g. "Cancelled by
          # user", "Cancelled by schedule sweep", "Credit balance exhausted").
          message: nil
        )
        end

        sig { override.returns({ message: String }) }
        def to_hash
        end
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ObjectiveEventDataCancelled::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CANCELLED =
          T.let(
            :cancelled,
            Cadenya::ObjectiveEventDataCancelled::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ObjectiveEventDataCancelled::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
