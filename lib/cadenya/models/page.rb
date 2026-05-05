# frozen_string_literal: true

module Cadenya
  module Models
    class Page < Cadenya::Internal::Type::BaseModel
      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String, api_name: :nextCursor

      # @!attribute total
      #
      #   @return [Integer, nil]
      optional :total, Integer

      # @!method initialize(next_cursor: nil, total: nil)
      #   @param next_cursor [String]
      #   @param total [Integer]
    end
  end
end
