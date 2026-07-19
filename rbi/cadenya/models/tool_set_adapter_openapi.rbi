# typed: strong

module Cadenya
  module Models
    module ToolSetAdapterOpenAPI
      extend Cadenya::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Cadenya::ToolSetAdapterOpenAPIURL,
            Cadenya::ToolSetAdapterOpenAPIUploadID
          )
        end

      sig do
        override.returns(T::Array[Cadenya::ToolSetAdapterOpenAPI::Variants])
      end
      def self.variants
      end
    end
  end
end
