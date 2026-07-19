# typed: strong

module Cadenya
  module Models
    ObjectiveToolCallResultContentBlockText =
      Objectives::ObjectiveToolCallResultContentBlockText

    module Objectives
      class ObjectiveToolCallResultContentBlockText < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveToolCallResultContentBlockText,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(Cadenya::Objectives::ObjectiveToolCallResultTextBlock) }
        attr_reader :text

        sig do
          params(
            text: Cadenya::Objectives::ObjectiveToolCallResultTextBlock::OrHash
          ).void
        end
        attr_writer :text

        sig do
          returns(
            Cadenya::Objectives::ObjectiveToolCallResultContentBlockText::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            text: Cadenya::Objectives::ObjectiveToolCallResultTextBlock::OrHash,
            type:
              Cadenya::Objectives::ObjectiveToolCallResultContentBlockText::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(text:, type:)
        end

        sig do
          override.returns(
            {
              text: Cadenya::Objectives::ObjectiveToolCallResultTextBlock,
              type:
                Cadenya::Objectives::ObjectiveToolCallResultContentBlockText::Type::TaggedSymbol
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
                Cadenya::Objectives::ObjectiveToolCallResultContentBlockText::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TEXT =
            T.let(
              :text,
              Cadenya::Objectives::ObjectiveToolCallResultContentBlockText::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Objectives::ObjectiveToolCallResultContentBlockText::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
