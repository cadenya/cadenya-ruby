# frozen_string_literal: true

module Cadenya
  module Internal
    # @generic Elem
    #
    # @example
    #   if cursor_pagination.has_next?
    #     cursor_pagination = cursor_pagination.next_page
    #   end
    #
    # @example
    #   cursor_pagination.auto_paging_each do |agent|
    #     puts(agent)
    #   end
    class CursorPagination
      include Cadenya::Internal::Type::BasePage

      # @return [Array<generic<Elem>>, nil]
      attr_accessor :items

      # @return [Pagination]
      attr_accessor :pagination

      # @return [Boolean]
      def next_page?
        !items.to_a.empty? && !pagination&.next_cursor.to_s.empty?
      end

      # @raise [Cadenya::HTTP::Error]
      # @return [self]
      def next_page
        unless next_page?
          message = "No more pages available. Please check #next_page? before calling ##{__method__}"
          raise RuntimeError.new(message)
        end

        req = Cadenya::Internal::Util.deep_merge(@req, {query: {cursor: pagination&.next_cursor}})
        @client.request(req)
      end

      # @param blk [Proc]
      #
      # @yieldparam [generic<Elem>]
      def auto_paging_each(&blk)
        unless block_given?
          raise ArgumentError.new("A block must be given to ##{__method__}")
        end

        page = self
        loop do
          page.items&.each(&blk)

          break unless page.next_page?
          page = page.next_page
        end
      end

      # @api private
      #
      # @param client [Cadenya::Internal::Transport::BaseClient]
      # @param req [Hash{Symbol=>Object}]
      # @param headers [Hash{String=>String}]
      # @param page_data [Hash{Symbol=>Object}]
      def initialize(client:, req:, headers:, page_data:)
        super

        case page_data
        in {items: Array => items}
          @items = items.map { Cadenya::Internal::Type::Converter.coerce(@model, _1) }
        else
        end
        case page_data
        in {pagination: Hash | nil => pagination}
          @pagination =
            Cadenya::Internal::Type::Converter.coerce(
              Cadenya::Internal::CursorPagination::Pagination,
              pagination
            )
        else
        end
      end

      # @api private
      #
      # @return [String]
      def inspect
        model = Cadenya::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)}>"
      end

      class Pagination < Cadenya::Internal::Type::BaseModel
        # @!attribute next_cursor
        #
        #   @return [String, nil]
        optional :next_cursor, String

        # @!method initialize(next_cursor: nil)
        #   @param next_cursor [String]
      end
    end
  end
end
