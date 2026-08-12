# typed: strong

module Cadenya
  module Models
    CapabilityTemperature =
      T.let(T.anything, Cadenya::Internal::Type::Converter)
  end
end
