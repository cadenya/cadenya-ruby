# frozen_string_literal: true

module Cadenya
  module Models
    class UserMessage < Cadenya::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [String, nil]
      optional :content, String

      # @!method initialize(content: nil)
      #   @param content [String]
    end
  end
end
