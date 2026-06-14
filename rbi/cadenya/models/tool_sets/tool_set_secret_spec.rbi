# typed: strong

module Cadenya
  module Models
    ToolSetSecretSpec = ToolSets::ToolSetSecretSpec

    module ToolSets
      class ToolSetSecretSpec < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ToolSets::ToolSetSecretSpec,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :value

        sig { params(value: String).void }
        attr_writer :value

        sig { params(value: String).returns(T.attached_class) }
        def self.new(value: nil)
        end

        sig { override.returns({ value: String }) }
        def to_hash
        end
      end
    end
  end
end
