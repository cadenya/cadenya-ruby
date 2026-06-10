# typed: strong

module Cadenya
  module Models
    ObjectiveToolCallResultTextBlock =
      Objectives::ObjectiveToolCallResultTextBlock

    module Objectives
      class ObjectiveToolCallResultTextBlock < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveToolCallResultTextBlock,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :text

        sig { params(text: String).returns(T.attached_class) }
        def self.new(text:)
        end

        sig { override.returns({ text: String }) }
        def to_hash
        end
      end
    end
  end
end
