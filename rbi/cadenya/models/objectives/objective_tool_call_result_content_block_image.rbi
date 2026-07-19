# typed: strong

module Cadenya
  module Models
    ObjectiveToolCallResultContentBlockImage =
      Objectives::ObjectiveToolCallResultContentBlockImage

    module Objectives
      class ObjectiveToolCallResultContentBlockImage < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveToolCallResultContentBlockImage,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(Cadenya::Objectives::ObjectiveToolCallResultImageBlock) }
        attr_reader :image

        sig do
          params(
            image:
              Cadenya::Objectives::ObjectiveToolCallResultImageBlock::OrHash
          ).void
        end
        attr_writer :image

        sig do
          returns(
            Cadenya::Objectives::ObjectiveToolCallResultContentBlockImage::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            image:
              Cadenya::Objectives::ObjectiveToolCallResultImageBlock::OrHash,
            type:
              Cadenya::Objectives::ObjectiveToolCallResultContentBlockImage::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(image:, type:)
        end

        sig do
          override.returns(
            {
              image: Cadenya::Objectives::ObjectiveToolCallResultImageBlock,
              type:
                Cadenya::Objectives::ObjectiveToolCallResultContentBlockImage::Type::TaggedSymbol
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
                Cadenya::Objectives::ObjectiveToolCallResultContentBlockImage::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IMAGE =
            T.let(
              :image,
              Cadenya::Objectives::ObjectiveToolCallResultContentBlockImage::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Objectives::ObjectiveToolCallResultContentBlockImage::Type::TaggedSymbol
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
