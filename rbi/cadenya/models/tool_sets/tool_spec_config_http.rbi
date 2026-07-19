# typed: strong

module Cadenya
  module Models
    module ToolSets
      class ToolSpecConfigHTTP < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ToolSets::ToolSpecConfigHTTP,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(Cadenya::ToolSets::ConfigHTTP) }
        attr_reader :http

        sig { params(http: Cadenya::ToolSets::ConfigHTTP::OrHash).void }
        attr_writer :http

        sig { returns(Cadenya::ToolSets::ToolSpecConfigHTTP::Type::OrSymbol) }
        attr_accessor :type

        sig do
          params(
            http: Cadenya::ToolSets::ConfigHTTP::OrHash,
            type: Cadenya::ToolSets::ToolSpecConfigHTTP::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(http:, type:)
        end

        sig do
          override.returns(
            {
              http: Cadenya::ToolSets::ConfigHTTP,
              type: Cadenya::ToolSets::ToolSpecConfigHTTP::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::ToolSets::ToolSpecConfigHTTP::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HTTP =
            T.let(
              :http,
              Cadenya::ToolSets::ToolSpecConfigHTTP::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::ToolSets::ToolSpecConfigHTTP::Type::TaggedSymbol
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
