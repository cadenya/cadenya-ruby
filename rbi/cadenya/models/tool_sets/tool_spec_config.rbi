# typed: strong

module Cadenya
  module Models
    module ToolSets
      class ToolSpecConfig < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::ToolSets::ToolSpecConfig, Cadenya::Internal::AnyHash)
          end

        sig { returns(T.nilable(Cadenya::ToolSets::ConfigHTTP)) }
        attr_reader :http

        sig { params(http: Cadenya::ToolSets::ConfigHTTP::OrHash).void }
        attr_writer :http

        sig { returns(T.nilable(Cadenya::ToolSets::ConfigMcp)) }
        attr_reader :mcp

        sig { params(mcp: Cadenya::ToolSets::ConfigMcp::OrHash).void }
        attr_writer :mcp

        # Config defines the adapter to use for the tool. This is used to determine how
        # the tool is called. For example, if the tool is an HTTP tool, the adapter will
        # be Http. If the tool is an inline tool, the adapter will be Inline.
        sig do
          params(
            http: Cadenya::ToolSets::ConfigHTTP::OrHash,
            mcp: Cadenya::ToolSets::ConfigMcp::OrHash
          ).returns(T.attached_class)
        end
        def self.new(http: nil, mcp: nil)
        end

        sig do
          override.returns(
            {
              http: Cadenya::ToolSets::ConfigHTTP,
              mcp: Cadenya::ToolSets::ConfigMcp
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
