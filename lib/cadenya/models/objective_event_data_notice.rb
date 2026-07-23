# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataNotice < Cadenya::Internal::Type::BaseModel
      # @!attribute notice
      #   Notice is a non-terminal diagnostic emitted by the runtime when something
      #   noteworthy but non-fatal happens during an objective — for example a
      #   just-in-time tool set failing to load, or a previously loaded tool being dropped
      #   because it was archived. Notices carry no structured payload; they exist to make
      #   the objective timeline self-explanatory.
      #
      #   @return [Cadenya::Models::ObjectiveEventDataNotice::Notice]
      required :notice, -> { Cadenya::ObjectiveEventDataNotice::Notice }

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataNotice::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataNotice::Type }

      # @!method initialize(notice:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveEventDataNotice} for more details.
      #
      #   @param notice [Cadenya::Models::ObjectiveEventDataNotice::Notice] Notice is a non-terminal diagnostic emitted by the runtime when something
      #
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataNotice::Type]

      # @see Cadenya::Models::ObjectiveEventDataNotice#notice
      class Notice < Cadenya::Internal::Type::BaseModel
        # @!attribute key
        #   Stable machine-readable identifier for the notice kind (for example
        #   "tool_set_load_failed", "tool_archived"). Clients can switch on it or use it as
        #   an i18n key; the message is the English fallback.
        #
        #   @return [String, nil]
        optional :key, String

        # @!attribute level
        #
        #   @return [Symbol, Cadenya::Models::ObjectiveEventDataNotice::Notice::Level, nil]
        optional :level, enum: -> { Cadenya::ObjectiveEventDataNotice::Notice::Level }

        # @!attribute message
        #   Human-readable description of what happened.
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(key: nil, level: nil, message: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ObjectiveEventDataNotice::Notice} for more details.
        #
        #   Notice is a non-terminal diagnostic emitted by the runtime when something
        #   noteworthy but non-fatal happens during an objective — for example a
        #   just-in-time tool set failing to load, or a previously loaded tool being dropped
        #   because it was archived. Notices carry no structured payload; they exist to make
        #   the objective timeline self-explanatory.
        #
        #   @param key [String] Stable machine-readable identifier for the notice kind (for example
        #
        #   @param level [Symbol, Cadenya::Models::ObjectiveEventDataNotice::Notice::Level]
        #
        #   @param message [String] Human-readable description of what happened.

        # @see Cadenya::Models::ObjectiveEventDataNotice::Notice#level
        module Level
          extend Cadenya::Internal::Type::Enum

          LEVEL_UNSPECIFIED = :LEVEL_UNSPECIFIED
          LEVEL_INFO = :LEVEL_INFO
          LEVEL_WARN = :LEVEL_WARN

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Cadenya::Models::ObjectiveEventDataNotice#type
      module Type
        extend Cadenya::Internal::Type::Enum

        NOTICE = :notice

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
