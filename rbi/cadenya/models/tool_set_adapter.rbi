# typed: strong

module Cadenya
  module Models
    module ToolSetAdapter
      extend Cadenya::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Cadenya::ToolSetAdapterMCPVariant,
            Cadenya::ToolSetAdapterHTTPVariant,
            Cadenya::ToolSetAdapterOpenAPIVariant,
            Cadenya::ToolSetAdapterBareVariant
          )
        end

      sig { override.returns(T::Array[Cadenya::ToolSetAdapter::Variants]) }
      def self.variants
      end
    end
  end
end
