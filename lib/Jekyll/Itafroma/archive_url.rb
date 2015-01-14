#
# An archive URL.
#
# Author:: Mark Trapp
# Copyright: Copyright (c) 2015 Mark Trapp
# License:: MIT
# Acknowledgements:: Inspired by the work done by nlindley and ilkka on Github:
#     https://gist.github.com/nlindley/6409459
#     https://gist.github.com/nlindley/6409441
#     https://gist.github.com/ilkka/707020
#     https://gist.github.com/ilkka/707909

module Jekyll
  module Itafroma
    class ArchiveURL

      # Initialize a new ArchiveURL.
      #
      # post - The post to generate a URL for.
      #
      # Returns nothing.
      def initialize(post)
        @post = post
      end

      # Generate the URL for the post.
      #
      # Returns a String containing the URL.
      def url(path)
        compiled_path = URL.new({
          :template => path,
          :placeholders => url_placeholders
        }).to_s
        File.join(compiled_path, 'index.html')
      end

      # Returns a hash of URL placeholder names (as symbols) mapping to the
      # desired placeholder replacements. For details see Jekyll's "url.rb"
      def url_placeholders
        {
          :year        => @post.date.strftime('%Y'),
          :short_year  => @post.date.strftime('%y'),
          :month       => @post.date.strftime('%m'),
          :i_month     => @post.date.strftime('%-m'),
          :short_month => @post.date.strftime('%b'),
          :long_month  => @post.date.strftime('%B'),
          :day         => @post.date.strftime('%d'),
          :i_day       => @post.date.strftime('%-d'),
          :y_day       => @post.date.strftime('%j')
        }
      end
    end
  end
end
