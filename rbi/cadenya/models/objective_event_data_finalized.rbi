# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataFinalized < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveEventDataFinalized,
            Cadenya::Internal::AnyHash
          )
        end

      # ObjectiveFinalized is the terminal event written when an objective is finalized.
      # After this event, the objective is super-terminal: no further iterations,
      # compaction, or continuation are permitted.
      sig { returns(Cadenya::ObjectiveEventDataFinalized::Finalized) }
      attr_reader :finalized

      sig do
        params(
          finalized: Cadenya::ObjectiveEventDataFinalized::Finalized::OrHash
        ).void
      end
      attr_writer :finalized

      sig { returns(Cadenya::ObjectiveEventDataFinalized::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          finalized: Cadenya::ObjectiveEventDataFinalized::Finalized::OrHash,
          type: Cadenya::ObjectiveEventDataFinalized::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # ObjectiveFinalized is the terminal event written when an objective is finalized.
        # After this event, the objective is super-terminal: no further iterations,
        # compaction, or continuation are permitted.
        finalized:,
        type:
      )
      end

      sig do
        override.returns(
          {
            finalized: Cadenya::ObjectiveEventDataFinalized::Finalized,
            type: Cadenya::ObjectiveEventDataFinalized::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Finalized < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ObjectiveEventDataFinalized::Finalized,
              Cadenya::Internal::AnyHash
            )
          end

        # If the objective was created with an output schema, and the agent successfully
        # completed the objective, this field will contain the structured output of the
        # objective.
        sig { returns(T.nilable(T.anything)) }
        attr_reader :output

        sig { params(output: T.anything).void }
        attr_writer :output

        # ObjectiveFinalized is the terminal event written when an objective is finalized.
        # After this event, the objective is super-terminal: no further iterations,
        # compaction, or continuation are permitted.
        sig { params(output: T.anything).returns(T.attached_class) }
        def self.new(
          # If the objective was created with an output schema, and the agent successfully
          # completed the objective, this field will contain the structured output of the
          # objective.
          output: nil
        )
        end

        sig { override.returns({ output: T.anything }) }
        def to_hash
        end
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ObjectiveEventDataFinalized::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FINALIZED =
          T.let(
            :finalized,
            Cadenya::ObjectiveEventDataFinalized::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ObjectiveEventDataFinalized::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
