# typed: strong

module Cadenya
  module Models
    module ToolSets
      class ToolSpecConfigBare < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ToolSets::ToolSpecConfigBare,
              Cadenya::Internal::AnyHash
            )
          end

        # Marks the tool as bare: it has no execution adapter of its own and relies on the
        # parent tool set being a Bare tool set. Present so a webhook consumer can tell a
        # tool is bare from the tool data alone, without cross-referencing the tool set.
        sig { returns(Cadenya::ToolSets::ConfigBare) }
        attr_reader :bare

        sig { params(bare: Cadenya::ToolSets::ConfigBare::OrHash).void }
        attr_writer :bare

        sig { returns(Cadenya::ToolSets::ToolSpecConfigBare::Type::OrSymbol) }
        attr_accessor :type

        sig do
          params(
            bare: Cadenya::ToolSets::ConfigBare::OrHash,
            type: Cadenya::ToolSets::ToolSpecConfigBare::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Marks the tool as bare: it has no execution adapter of its own and relies on the
          # parent tool set being a Bare tool set. Present so a webhook consumer can tell a
          # tool is bare from the tool data alone, without cross-referencing the tool set.
          bare:,
          type:
        )
        end

        sig do
          override.returns(
            {
              bare: Cadenya::ToolSets::ConfigBare,
              type: Cadenya::ToolSets::ToolSpecConfigBare::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::ToolSets::ToolSpecConfigBare::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BARE =
            T.let(
              :bare,
              Cadenya::ToolSets::ToolSpecConfigBare::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::ToolSets::ToolSpecConfigBare::Type::TaggedSymbol
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
