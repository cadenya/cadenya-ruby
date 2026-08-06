# typed: strong

module Cadenya
  module Models
    # String matching operations
    module StringMatcher
      extend Cadenya::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Cadenya::StringMatcherExact,
            Cadenya::StringMatcherStartsWith,
            Cadenya::StringMatcherEndsWith,
            Cadenya::StringMatcherContains,
            Cadenya::StringMatcherRegex
          )
        end

      sig { override.returns(T::Array[Cadenya::StringMatcher::Variants]) }
      def self.variants
      end
    end
  end
end
