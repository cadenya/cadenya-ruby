# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataNotice < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveEventDataNotice, Cadenya::Internal::AnyHash)
        end

      # Notice is a non-terminal diagnostic emitted by the runtime when something
      # noteworthy but non-fatal happens during an objective — for example a
      # just-in-time tool set failing to load, or a previously loaded tool being dropped
      # because it was archived. Notices carry no structured payload; they exist to make
      # the objective timeline self-explanatory.
      sig { returns(Cadenya::ObjectiveEventDataNotice::Notice) }
      attr_reader :notice

      sig do
        params(notice: Cadenya::ObjectiveEventDataNotice::Notice::OrHash).void
      end
      attr_writer :notice

      sig { returns(Cadenya::ObjectiveEventDataNotice::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          notice: Cadenya::ObjectiveEventDataNotice::Notice::OrHash,
          type: Cadenya::ObjectiveEventDataNotice::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Notice is a non-terminal diagnostic emitted by the runtime when something
        # noteworthy but non-fatal happens during an objective — for example a
        # just-in-time tool set failing to load, or a previously loaded tool being dropped
        # because it was archived. Notices carry no structured payload; they exist to make
        # the objective timeline self-explanatory.
        notice:,
        type:
      )
      end

      sig do
        override.returns(
          {
            notice: Cadenya::ObjectiveEventDataNotice::Notice,
            type: Cadenya::ObjectiveEventDataNotice::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Notice < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ObjectiveEventDataNotice::Notice,
              Cadenya::Internal::AnyHash
            )
          end

        # Stable machine-readable identifier for the notice kind (for example
        # "tool_set_load_failed", "tool_archived"). Clients can switch on it or use it as
        # an i18n key; the message is the English fallback.
        sig { returns(String) }
        attr_accessor :key

        sig do
          returns(
            T.nilable(
              Cadenya::ObjectiveEventDataNotice::Notice::Level::TaggedSymbol
            )
          )
        end
        attr_reader :level

        sig do
          params(
            level: Cadenya::ObjectiveEventDataNotice::Notice::Level::OrSymbol
          ).void
        end
        attr_writer :level

        # Human-readable description of what happened.
        sig { returns(String) }
        attr_accessor :message

        # Notice is a non-terminal diagnostic emitted by the runtime when something
        # noteworthy but non-fatal happens during an objective — for example a
        # just-in-time tool set failing to load, or a previously loaded tool being dropped
        # because it was archived. Notices carry no structured payload; they exist to make
        # the objective timeline self-explanatory.
        sig do
          params(
            key: String,
            level: Cadenya::ObjectiveEventDataNotice::Notice::Level::OrSymbol,
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Stable machine-readable identifier for the notice kind (for example
          # "tool_set_load_failed", "tool_archived"). Clients can switch on it or use it as
          # an i18n key; the message is the English fallback.
          key:,
          level:,
          # Human-readable description of what happened.
          message:
        )
        end

        sig do
          override.returns(
            {
              key: String,
              level:
                Cadenya::ObjectiveEventDataNotice::Notice::Level::TaggedSymbol,
              message: String
            }
          )
        end
        def to_hash
        end

        module Level
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::ObjectiveEventDataNotice::Notice::Level)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LEVEL_UNSPECIFIED =
            T.let(
              :LEVEL_UNSPECIFIED,
              Cadenya::ObjectiveEventDataNotice::Notice::Level::TaggedSymbol
            )
          LEVEL_INFO =
            T.let(
              :LEVEL_INFO,
              Cadenya::ObjectiveEventDataNotice::Notice::Level::TaggedSymbol
            )
          LEVEL_WARN =
            T.let(
              :LEVEL_WARN,
              Cadenya::ObjectiveEventDataNotice::Notice::Level::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::ObjectiveEventDataNotice::Notice::Level::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ObjectiveEventDataNotice::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NOTICE =
          T.let(:notice, Cadenya::ObjectiveEventDataNotice::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::ObjectiveEventDataNotice::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
