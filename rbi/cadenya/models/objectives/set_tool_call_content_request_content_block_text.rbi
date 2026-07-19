# typed: strong

module Cadenya
  module Models
    module Objectives
      class SetToolCallContentRequestContentBlockText < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::SetToolCallContentRequestContentBlockText,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(Cadenya::Objectives::SetToolCallContentRequestTextBlock) }
        attr_reader :text

        sig do
          params(
            text:
              Cadenya::Objectives::SetToolCallContentRequestTextBlock::OrHash
          ).void
        end
        attr_writer :text

        sig do
          returns(
            Cadenya::Objectives::SetToolCallContentRequestContentBlockText::Type::OrSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            text:
              Cadenya::Objectives::SetToolCallContentRequestTextBlock::OrHash,
            type:
              Cadenya::Objectives::SetToolCallContentRequestContentBlockText::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(text:, type:)
        end

        sig do
          override.returns(
            {
              text: Cadenya::Objectives::SetToolCallContentRequestTextBlock,
              type:
                Cadenya::Objectives::SetToolCallContentRequestContentBlockText::Type::OrSymbol
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
                Cadenya::Objectives::SetToolCallContentRequestContentBlockText::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TEXT =
            T.let(
              :text,
              Cadenya::Objectives::SetToolCallContentRequestContentBlockText::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Objectives::SetToolCallContentRequestContentBlockText::Type::TaggedSymbol
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
