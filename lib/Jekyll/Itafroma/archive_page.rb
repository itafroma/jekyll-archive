#
# An archive listing page.
#
# Author:: Mark Trapp
# Copyright: Copyright (c) 2013-2014 Mark Trapp
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
      # date_pattern - The pattern of the date the posts are collated on
      # posts        - The posts to be added to the ArchivePage.
      def initialize(site, base, date_pattern, posts)
        @site = site
        @config = site.config['archive']
        @posts = posts

        @date_pattern = date_pattern
        @base = base
        @dir = dir
        @name = 'index.html'

        process(@name)

        layout = @config['layout'] || 'archive'
        read_yaml(File.join(base, '_layouts'), "#{layout}.html")

        populate_data!
      end

      # Generate the start date of the archive.
      #
      # To determine the archive's start date, the date of the first post is
      # converted to a string using `@date_pattern`. Doing this will clear any
      # precision beyond what's specified in `@date_pattern`.
      #
      # Returns a DateTime containing the archive's start date.
      def date
        date_string = @posts.first.date.strftime(@date_pattern)
        DateTime.strptime(date_string, @date_pattern)
      end

      # Generate the ArchivePage title.
      #
      # Returns a String containing the ArchivePage title.
      def title
        tokenized_title = @config['title'] || 'Blog archive - :date'
        tokenized_title.gsub(':date', date.strftime(@date_pattern))
      end

      # Generate the ArchivePage url.
      #
      # Returns a String containing the ArchivePage url.
      def url
        base = @config['path'] || '/'
        File.join(base, date.strftime(@date_pattern), 'index.html')
      end

      # Add the ArchivePage-specific data to the regular Page data.
      #
      # Returns nothing.
      def populate_data!
        data.merge!('date' => date,
                    'title' => title,
                    'archive' => {
                      'date_pattern' => @date_pattern,
                      'posts' => @posts
                    })
      end
    end
  end
end
