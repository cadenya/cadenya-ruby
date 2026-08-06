# typed: strong

module Cadenya
  module Models
    module ToolSets
      # Config defines the adapter to use for the tool. This is used to determine how
      # the tool is called. For example, if the tool is an HTTP tool, the adapter will
      # be Http. If the tool is an inline tool, the adapter will be Inline.
      module ToolSpecConfig
        extend Cadenya::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Cadenya::ToolSets::ToolSpecConfigHTTP,
              Cadenya::ToolSets::ToolSpecConfigMCP,
              Cadenya::ToolSets::ToolSpecConfigOpenAPI,
              Cadenya::ToolSets::ToolSpecConfigBare
            )
          end

        sig do
          override.returns(
            T::Array[Cadenya::ToolSets::ToolSpecConfig::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
