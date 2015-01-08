#
# An archive listing pager.
#
# Adapted from Jekyll::Generators::Pagination
#
# Author:: Mark Trapp
# Copyright: Copyright (c) 2014 Mark Trapp
# License:: MIT
# Acknowledgements:: Inspired by the work done by nlindley and ilkka on Github:
#     https://gist.github.com/nlindley/6409459
#     https://gist.github.com/nlindley/6409441
#     https://gist.github.com/ilkka/707020
#     https://gist.github.com/ilkka/707909
module Jekyll
  module Itafroma
    # Represents the pager used for ArchivePages.
    class ArchivePager
      attr_reader :page, :per_page, :pages, :total_posts, :total_pages,
                  :previous_page, :previous_page_path, :next_page,
                  :next_page_path

      # Static: Return the pagination path of the archive page
      #
      # posts     - The Array of the archive's Posts.
      # num_page  - the pagination page number
      #
      # Returns the pagination path as a string
      def self.paginate_path(posts, num_page)
        return posts.first.url if num_page.nil?
        return nil if num_page < 1
        return nil if num_page > posts.size
        posts[num_page - 1].url
      end

      # Initialize a new Archive Pager.
      #
      # site      - the Jekyll::Site object
      # page      - The Integer page number.
      # all_pages - The Array of the archive's Posts.
      # num_pages - The Integer number of pages or nil if you'd like the number
      #             of pages calculated.
      def initialize(site, page, all_pages, num_pages = nil)
        @page = page
        @per_page = 1
        @total_pages = num_pages || all_pages.size

        if @page > @total_pages
          fail "Jekyll Archive Generator: page number can't be greater than total pages: #{@page} > #{@total_pages}"
        end

        @pages = all_pages
        @previous_page = @page != 1 ? @page - 1 : nil
        @previous_page_path = ArchivePager.paginate_path(all_pages, @previous_page)
        @next_page = @page != @total_pages ? @page + 1 : nil
        @next_page_path = ArchivePager.paginate_path(all_pages, @next_page)
      end

      # Convert this Pager's data to a Hash suitable for use by Liquid.
      #
      # Returns the Hash representation of this Pager.
      def to_liquid
        {
          'page' => page,
          'per_page' => per_page,
          'pages' => pages,
          'total_pages' => total_pages,
          'previous_page' => previous_page,
          'previous_page_path' => previous_page_path,
          'next_page' => next_page,
          'next_page_path' => next_page_path
        }
      end
    end
  end
end
