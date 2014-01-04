#
# An archive listing page.
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
    ##
    # Represents an archive listing page.

    class ArchivePage < Page
      def initialize(site, base, pattern, posts)
        @site = site
        @base = base
        @dir = posts.first.date.strftime(pattern)
        @name = 'index.html'

        process(@name)

        layout = site.config['archive']['layout'] || 'archive'
        read_yaml(File.join(base, '_layouts'), "#{layout}.html")

        data['posts'] = posts
        data['date'] = {
          'value' => posts.first.date,
          'pattern' => pattern,
        }
      end

      def url
        base = site.config['archive']['path'] || '/'
        File.join(base, @dir, 'index.html')
      end

      def to_liquid
        data.deep_merge('url' => url, 'content' => content)
      end
    end
  end
end
