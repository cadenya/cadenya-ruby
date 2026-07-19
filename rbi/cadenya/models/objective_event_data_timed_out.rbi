# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataTimedOut < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveEventDataTimedOut, Cadenya::Internal::AnyHash)
        end

      # ObjectiveTimedOut is the terminal event written when an objective is finalized
      # by the inactivity sweep because it saw no activity (no user messages, no LLM
      # calls) within its variation's inactivity timeout — or the system-wide 24 hour
      # maximum when no timeout is configured. The objective produces no output. After
      # this event, the objective is super-terminal: no further iterations, compaction,
      # or continuation are permitted.
      sig { returns(Cadenya::ObjectiveEventDataTimedOut::TimedOut) }
      attr_reader :timed_out

      sig do
        params(
          timed_out: Cadenya::ObjectiveEventDataTimedOut::TimedOut::OrHash
        ).void
      end
      attr_writer :timed_out

      sig { returns(Cadenya::ObjectiveEventDataTimedOut::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          timed_out: Cadenya::ObjectiveEventDataTimedOut::TimedOut::OrHash,
          type: Cadenya::ObjectiveEventDataTimedOut::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # ObjectiveTimedOut is the terminal event written when an objective is finalized
        # by the inactivity sweep because it saw no activity (no user messages, no LLM
        # calls) within its variation's inactivity timeout — or the system-wide 24 hour
        # maximum when no timeout is configured. The objective produces no output. After
        # this event, the objective is super-terminal: no further iterations, compaction,
        # or continuation are permitted.
        timed_out:,
        type:
      )
      end

      sig do
        override.returns(
          {
            timed_out: Cadenya::ObjectiveEventDataTimedOut::TimedOut,
            type: Cadenya::ObjectiveEventDataTimedOut::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class TimedOut < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ObjectiveEventDataTimedOut::TimedOut,
              Cadenya::Internal::AnyHash
            )
          end

        # Human-readable note recorded at timeout time (e.g. "Timed out after 2h of
        # inactivity").
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # ObjectiveTimedOut is the terminal event written when an objective is finalized
        # by the inactivity sweep because it saw no activity (no user messages, no LLM
        # calls) within its variation's inactivity timeout — or the system-wide 24 hour
        # maximum when no timeout is configured. The objective produces no output. After
        # this event, the objective is super-terminal: no further iterations, compaction,
        # or continuation are permitted.
        sig { params(message: String).returns(T.attached_class) }
        def self.new(
          # Human-readable note recorded at timeout time (e.g. "Timed out after 2h of
          # inactivity").
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
            T.all(Symbol, Cadenya::ObjectiveEventDataTimedOut::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TIMED_OUT =
          T.let(
            :timedOut,
            Cadenya::ObjectiveEventDataTimedOut::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ObjectiveEventDataTimedOut::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
