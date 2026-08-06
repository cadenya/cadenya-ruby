# frozen_string_literal: true

module Cadenya
  module Models
    # String matching operations
    module StringMatcher
      extend Cadenya::Internal::Type::Union

      discriminator :type

      variant :exact, -> { Cadenya::StringMatcherExact }

      variant :startsWith, -> { Cadenya::StringMatcherStartsWith }

      variant :endsWith, -> { Cadenya::StringMatcherEndsWith }

      variant :contains, -> { Cadenya::StringMatcherContains }

      variant :regex, -> { Cadenya::StringMatcherRegex }

      # @!method self.variants
      #   @return [Array(Cadenya::Models::StringMatcherExact, Cadenya::Models::StringMatcherStartsWith, Cadenya::Models::StringMatcherEndsWith, Cadenya::Models::StringMatcherContains, Cadenya::Models::StringMatcherRegex)]
    end
  end
end
