# typed: strong

module Cadenya
  module Models
    ObjectiveToolCallResult = Objectives::ObjectiveToolCallResult

    module Objectives
      class ObjectiveToolCallResult < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveToolCallResult,
              Cadenya::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[Cadenya::Objectives::ObjectiveToolCallResultContentBlock]
          )
        end
        attr_accessor :content

        # ObjectiveToolCallResult is the content a tool returned after execution. Tools
        # can return multiple content blocks, and blocks can be multi-modal (text, image,
        # audio). Media blocks are stored by Cadenya and served as short-lived signed URLs
        # rather than inline bytes.
        sig do
          params(
            content:
              T::Array[
                Cadenya::Objectives::ObjectiveToolCallResultContentBlock::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(content:)
        end

        sig do
          override.returns(
            {
              content:
                T::Array[
                  Cadenya::Objectives::ObjectiveToolCallResultContentBlock
                ]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
