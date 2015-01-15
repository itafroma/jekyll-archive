#
# Substitution for strings used in Jekyll Archive Generator.
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
    class ArchiveSubstitution

      # Initialize a new ArchiveSubstitution.
      #
      # post - The post to generate a URL for.
      #
      # Returns nothing.
      def initialize(post)
        @post = post
      end

      # Substitute placeholders within a string with data from the post.
      #
      # Adapted from Jekyll::URL::generate_url.
      #
      # Returns a string containing the substituted post data.
      def translate(template)
        placeholders.inject(template) do |result, token|
          break result if result.index(':').nil?
          result.gsub(/:#{token.first}/, token.last)
        end
      end

      # Returns a Jekyll URL object for the given template.
      def url(template)
        URL.new({
          :template => template,
          :placeholders => placeholders
        })
      end

      # Returns a hash of placeholder names (as symbols) mapping to the desired
      # placeholder replacements.
      def placeholders
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
