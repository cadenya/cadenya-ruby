# typed: strong

module Cadenya
  module Models
    module ToolSets
      class ToolSpecConfig < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::ToolSets::ToolSpecConfig, Cadenya::Internal::AnyHash)
          end

        # Marks the tool as bare: it has no execution adapter of its own and relies on the
        # parent tool set being a Bare tool set. Present so a webhook consumer can tell a
        # tool is bare from the tool data alone, without cross-referencing the tool set.
        sig { returns(T.nilable(Cadenya::ToolSets::ConfigBare)) }
        attr_reader :bare

        sig { params(bare: Cadenya::ToolSets::ConfigBare::OrHash).void }
        attr_writer :bare

        sig { returns(T.nilable(Cadenya::ToolSets::ConfigHTTP)) }
        attr_reader :http

        sig { params(http: Cadenya::ToolSets::ConfigHTTP::OrHash).void }
        attr_writer :http

        sig { returns(T.nilable(Cadenya::ToolSets::ConfigMcp)) }
        attr_reader :mcp

        sig { params(mcp: Cadenya::ToolSets::ConfigMcp::OrHash).void }
        attr_writer :mcp

        sig { returns(T.nilable(Cadenya::ToolSets::ConfigOpenAPI)) }
        attr_reader :openapi

        sig { params(openapi: Cadenya::ToolSets::ConfigOpenAPI::OrHash).void }
        attr_writer :openapi

        # Config defines the adapter to use for the tool. This is used to determine how
        # the tool is called. For example, if the tool is an HTTP tool, the adapter will
        # be Http. If the tool is an inline tool, the adapter will be Inline.
        sig do
          params(
            bare: Cadenya::ToolSets::ConfigBare::OrHash,
            http: Cadenya::ToolSets::ConfigHTTP::OrHash,
            mcp: Cadenya::ToolSets::ConfigMcp::OrHash,
            openapi: Cadenya::ToolSets::ConfigOpenAPI::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Marks the tool as bare: it has no execution adapter of its own and relies on the
          # parent tool set being a Bare tool set. Present so a webhook consumer can tell a
          # tool is bare from the tool data alone, without cross-referencing the tool set.
          bare: nil,
          http: nil,
          mcp: nil,
          openapi: nil
        )
        end

        sig do
          override.returns(
            {
              bare: Cadenya::ToolSets::ConfigBare,
              http: Cadenya::ToolSets::ConfigHTTP,
              mcp: Cadenya::ToolSets::ConfigMcp,
              openapi: Cadenya::ToolSets::ConfigOpenAPI
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
