#
# An archive listing pager.
#
# Author:: Mark Trapp
# Copyright: Copyright (c) 2013 Mark Trapp
# License:: MIT
# Acknowledgements:: Inspired by the work done by nlindley and ilkka on Github:
#     https://gist.github.com/nlindley/6409459
#     https://gist.github.com/nlindley/6409441
#     https://gist.github.com/ilkka/707020
#     https://gist.github.com/ilkka/707909
module Jekyll
  module Itafroma
    class ArchivePager < Pager

      # Static: Return the pagination path of the archive page
      #
      # posts     - The Array of the archive's Posts.
      # num_page - the pagination page number
      #
      # Returns the pagination path as a string
      def self.paginate_archive_path(posts, num_page)
        return posts.first.url if num_page.nil?
        return nil if num_page < 1
        return nil if num_page > posts.size
        posts[num_page - 1].url
      end

      # Initialize a new Archive Pager.
      #
      # site     - the Jekyll::Site object
      # page      - The Integer page number.
      # all_posts - The Array of the archive's Posts.
      # num_pages - The Integer number of pages or nil if you'd like the number
      #             of pages calculated.
      def initialize(site, page, all_posts, num_pages = nil)
        super
        @previous_page_path = ArchivePager.paginate_archive_path(all_posts, @previous_page)
        @next_page_path = ArchivePager.paginate_archive_path(all_posts, @next_page)
      end
    end
  end
end
