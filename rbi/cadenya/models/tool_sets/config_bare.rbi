# typed: strong

module Cadenya
  module Models
    module ToolSets
      class ConfigBare < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::ToolSets::ConfigBare, Cadenya::Internal::AnyHash)
          end

        # Marks the tool as bare: it has no execution adapter of its own and relies on the
        # parent tool set being a Bare tool set. Present so a webhook consumer can tell a
        # tool is bare from the tool data alone, without cross-referencing the tool set.
        sig { returns(T.attached_class) }
        def self.new
        end

        sig { override.returns({}) }
        def to_hash
        end
      end
    end
  end
end
