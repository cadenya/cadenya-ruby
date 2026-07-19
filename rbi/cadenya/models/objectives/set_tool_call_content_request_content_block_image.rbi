# typed: strong

module Cadenya
  module Models
    module Objectives
      class SetToolCallContentRequestContentBlockImage < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::SetToolCallContentRequestContentBlockImage,
              Cadenya::Internal::AnyHash
            )
          end

        sig do
          returns(Cadenya::Objectives::SetToolCallContentRequestImageBlock)
        end
        attr_reader :image

        sig do
          params(
            image:
              Cadenya::Objectives::SetToolCallContentRequestImageBlock::OrHash
          ).void
        end
        attr_writer :image

        sig do
          returns(
            Cadenya::Objectives::SetToolCallContentRequestContentBlockImage::Type::OrSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            image:
              Cadenya::Objectives::SetToolCallContentRequestImageBlock::OrHash,
            type:
              Cadenya::Objectives::SetToolCallContentRequestContentBlockImage::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(image:, type:)
        end

        sig do
          override.returns(
            {
              image: Cadenya::Objectives::SetToolCallContentRequestImageBlock,
              type:
                Cadenya::Objectives::SetToolCallContentRequestContentBlockImage::Type::OrSymbol
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
                Cadenya::Objectives::SetToolCallContentRequestContentBlockImage::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IMAGE =
            T.let(
              :image,
              Cadenya::Objectives::SetToolCallContentRequestContentBlockImage::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Objectives::SetToolCallContentRequestContentBlockImage::Type::TaggedSymbol
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
