#
# Generates archive pages for year, month, and day.
#
# An archive listing will be created for each year, month, and day that
# contains a post.
#
# Author:: Mark Trapp
# Copyright: Copyright (c) 2013 Mark Trapp
# License:: MIT

module Jekyll
  module Itafroma
    # Generator for archive listings.
    class ArchiveGenerator < Generator
      # This generator is safe from arbitrary code execution.
      safe true

      # Generate archive pages.
      #
      # site - The site.
      #
      # Returns nothing.
      def generate(site)
        layout = site.config['archive']['layout'] || 'archive'
        if site.layouts.key? layout
          exclude_categories = site.config['archive']['exclude'] || []
          posts = site.posts.select do |post|
            (post.categories & exclude_categories).empty?
          end
          site.pages += generate_archive_pages(site, posts, '%Y/%m/%d')
          site.pages += generate_archive_pages(site, posts, '%Y/%m')
          site.pages += generate_archive_pages(site, posts, '%Y')
        end
      end

      private

      # Generate an archive page group.
      #
      # site    - The site.
      # posts   - The Posts to include in the archive.
      # pattern - The date pattern to collate the archive on
      #
      # Returns an Array of archive Pages.
      def generate_archive_pages(site, posts, pattern)
        pages = []

        collate(posts, pattern).each do |_, collated_posts|
          pages << ArchivePage.new(site, site.source, pattern, collated_posts)
        end

        pages.each_with_index do |page, index|
          page.pager = ArchivePager.new(site, index + 1, pages, pages.size)
        end

        pages
      end

      # Collate an Array of Posts by a date pattern.
      #
      # posts - The Posts to collate
      # pattern - The date pattern to collate the Posts on
      #
      # Returns a collated Hash of Posts.
      def collate(posts, pattern)
        collated = {}
        posts.each do |post|
          key = post.date.strftime(pattern)
          collated[key] ||= []
          collated[key] << post
        end
        collated
      end
    end
  end
end
