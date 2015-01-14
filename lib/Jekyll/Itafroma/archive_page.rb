#
# An archive listing page.
#
# Author:: Mark Trapp
# Copyright: Copyright (c) 2013-2015 Mark Trapp
# License:: MIT
# Acknowledgements:: Inspired by the work done by nlindley and ilkka on Github:
#     https://gist.github.com/nlindley/6409459
#     https://gist.github.com/nlindley/6409441
#     https://gist.github.com/ilkka/707020
#     https://gist.github.com/ilkka/707909

module Jekyll
  module Itafroma
    # Represents an archive listing page.
    class ArchivePage < Page
      # Initalize a new ArchivePage.
      #
      # site         - The site.
      # base         - The path to the site's root
      # layout       - The layout to use for the archive page
      # path         - The path to use for the archive page
      # title        - The tokenized title to use for the archive page
      # date_pattern - The pattern of the date the posts are collated on
      # posts        - The posts to be added to the ArchivePage.
      def initialize(site, base, layout, path, title, posts)
        @site = site
        @posts = posts

        @layout = layout
        @path = path
        @title = title
        @base = base
        @dir = dir
        @name = 'index.html'

        process(@name)

        read_yaml(File.join(base, '_layouts'), "#{@layout}.html")

        populate_data!
      end

      # Generate the start date of the archive.
      #
      # The date of the first post is used for the start date.
      #
      # Returns a DateTime containing the archive's start date.
      def date
        @posts.first.date
      end

      # Generate the ArchivePage title.
      #
      # Returns a String containing the ArchivePage title.
      def title
        @title
      end

      # Generate the ArchivePage url.
      #
      # Returns a String containing the ArchivePage url.
      def url
        ArchiveURL.new(@posts.first).url(@path)
      end

      # Add the ArchivePage-specific data to the regular Page data.
      #
      # Returns nothing.
      def populate_data!
        data.merge!('date' => date,
                    'title' => title,
                    'archive' => {
                      'posts' => @posts
                    })
      end
    end
  end
end
