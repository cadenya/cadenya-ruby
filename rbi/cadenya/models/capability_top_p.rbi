# typed: strong

module Cadenya
  module Models
    CapabilityTopP = T.let(T.anything, Cadenya::Internal::Type::Converter)
  end
end
