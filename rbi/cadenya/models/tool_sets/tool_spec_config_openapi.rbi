# typed: strong

module Cadenya
  module Models
    module ToolSets
      class ToolSpecConfigOpenAPI < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ToolSets::ToolSpecConfigOpenAPI,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(Cadenya::ToolSets::ConfigOpenAPI) }
        attr_reader :openapi

        sig { params(openapi: Cadenya::ToolSets::ConfigOpenAPI::OrHash).void }
        attr_writer :openapi

        sig do
          returns(Cadenya::ToolSets::ToolSpecConfigOpenAPI::Type::OrSymbol)
        end
        attr_accessor :type

        sig do
          params(
            openapi: Cadenya::ToolSets::ConfigOpenAPI::OrHash,
            type: Cadenya::ToolSets::ToolSpecConfigOpenAPI::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(openapi:, type:)
        end

        sig do
          override.returns(
            {
              openapi: Cadenya::ToolSets::ConfigOpenAPI,
              type: Cadenya::ToolSets::ToolSpecConfigOpenAPI::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::ToolSets::ToolSpecConfigOpenAPI::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OPENAPI =
            T.let(
              :openapi,
              Cadenya::ToolSets::ToolSpecConfigOpenAPI::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::ToolSets::ToolSpecConfigOpenAPI::Type::TaggedSymbol
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
