#
# Generates archive pages for year, month, and day.
#
# An archive listing will be created for each year, month, and day that
# contains a post.
#
# Author:: Mark Trapp
# Copyright: Copyright (c) 2013-2015 Mark Trapp
# License:: MIT

module Jekyll
  module Itafroma
    # Generator for archive listings.
    class ArchiveGenerator < Generator
      # This generator is safe from arbitrary code execution.
      safe true

      DEFAULT_LAYOUT = 'archive'
      DEFAULT_PATH = '/'
      DEFAULT_TITLE = 'Blog archive'
      DEFAULT_INCLUSIONS = {}
      DEFAULT_EXCLUSIONS = {}

      # Generate archive pages.
      #
      # site - The site.
      #
      # Returns nothing.
      def generate(site)
        archives = site.config['archive'] || []

        if archives.is_a? Hash
          puts 'Warning: the configuration format used for Jekyll Archive Generator is deprecated. Please see README for the new format.'
          archives = [archives]
        end

        archives.each do |archive|
          layout = archive['layout'] || DEFAULT_LAYOUT
          if site.layouts.key? layout
            path = archive['path'] || DEFAULT_PATH
            title = archive['title'] || DEFAULT_TITLE

            inclusions = archive['include'] || DEFAULT_INCLUSIONS
            posts = if inclusions.empty? 
              site.posts
            else 
              site.posts.select do |post|
                inclusions.any? do |key, inclusion|
                  (post[key] & inclusion).any?
                end
              end
            end

            exclusions = archive['exclude'] || DEFAULT_EXCLUSIONS
            exclusions.each do |key, exclusion|
              posts.reject! do |post|
                (post[key] & exclusion).any?
              end
            end

            site.pages += generate_archive_pages(site, posts, layout, path, title)
          end
        end
      end

      private

      # Generate an archive page group.
      #
      # site    - The site.
      # posts   - The Posts to include in the archive.
      # layout  - The layout to use for the archive page
      # path    - The path to use for the archive page
      # title   - The tokenized title to use for the archive page
      #
      # Returns an Array of archive Pages.
      def generate_archive_pages(site, posts, layout, path, title)
        pages = []

        collate(posts, path).each do |_, collated_posts|
          pages << ArchivePage.new(site, site.source, layout, path, title, collated_posts)
        end

        pages.each_with_index do |page, index|
          page.data['archive'].merge!({'paginator' => ArchivePager.new(site, index + 1, pages, pages.size)})
        end

        pages
      end

      # Collate an Array of Posts by a date pattern.
      #
      # posts - The Posts to collate
      # path - The path slug to collate the Posts on
      #
      # Returns a collated Hash of Posts.
      def collate(posts, path)
        collated = {}
        posts.each do |post|
          key = ArchiveURL.new(post).url(path)
          collated[key] ||= []
          collated[key] << post
        end
        collated
      end
    end
  end
end
