# typed: strong

module Cadenya
  module Models
    CapabilityMaxOutputTokens =
      T.let(T.anything, Cadenya::Internal::Type::Converter)
  end
end
