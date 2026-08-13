# frozen_string_literal: true

module Cadenya
  module Models
    class UserMessage < Cadenya::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [String]
      required :content, String

      # @!method initialize(content:)
      #   @param content [String]
    end
  end
end
