# frozen_string_literal: true

module Cadenya
  module Models
    class Page < Cadenya::Internal::Type::BaseModel
      # @!attribute next_cursor
      #
      #   @return [String, nil]
      optional :next_cursor, String, api_name: :nextCursor

      # @!method initialize(next_cursor: nil)
      #   Page carries cursor-based pagination state. There is no total: the cursor walks
      #   the result set without ever counting it, and a count would cost a second query
      #   on every list.
      #
      #   @param next_cursor [String]
    end
  end
end
