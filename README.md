# Jekyll Archive Generator

This plugin creates a set of archive pages for a Jekyll website.

Oddly, Jekyll doesn't include a date-based archive for posts out of the box. For
example, if you have a permalink structure like `blog/2014/01/01/title, URL
hacking won't work because going to `blog/2014` will return 404 Page Not Found.

Jekyll Archive Generator fixes that by generating all the necessary archive
pages for each part of your blog URL structure.

## Installation

This plugin is provided as a gem:

```sh
gem install jekyll-itafroma-archive
```

Once the gem is installed, include it in your Jekyll site's configuration:

```yaml
gems: ['jekyll/itafroma/archive']
```

## Configuration

This plugin's configuration is contained within the `archive` key and supports
multiple archives:

```yaml
archive:
    - layout: archive_blog
      path: /blog
      title: Blog Archive - :date
      include:
        tags: ['PHP']
      exclude: 
        categories: ['news']
        tags: ['drafts']
    - layout: archive_news
      path: /news
      title: News Archive - :date
      exclude: 
        categories: ['blog']
        tags: ['lifestyle', 'old']
```

* **layout**: The name of the layout to use for the archive pages. An example
  layout named `archive.html` is included in this repository.
* **path:** The path where the archive should be generated.
* **title:** The title of he archive pages. It has one token, `:date`, that will
  be replaced with a pretty version of the date.
* **include:** A mapping of front matter keys used to "whitelist" posts for the
  archive. Each key in the mapping is an array of strings for that specific key
  to include. This is conjunctive: if a post matches at least one condition,
  it will be included in the archive. For example, `categories: ['foo', 'bar']` 
  will ensure that only posts in the `foo` or `bar` categories will be included
  in the archive.
* **exclude:** A sequence of front matter keys used to exclude posts from the
  archive. Each key in the sequence is an array of strings for that specific 
  key to exclude. For example, `categories: ['foo', 'bar']` will exclude any
  post that has the `foo` or `bar` category. Exclusion filters are run *after*
  inclusion criteria specified by `include`.

## Acknowledgments

This plug is inspired by the work done by [Nicholas Lindley][1]:

* [archivepage.rb][2]
* [archivegenerator.rb][3]

And by [Ilkka Laukkanen][4]:

* [archivepage.rb][5]
* [archivegenerator.rb][6]

## Copyright and license

This plugin is copyright © 2013–2015 [Mark Trapp][7]. All rights reserved. It is
made available via the MIT license. A copy of the license can be found in the
`LICENSE` file.

## Related links

* [Canonical project page][8]
* [RubyGems project page][9]

[1]: http://www.thisoneplace.com "Nicholas Lindley’s website"
[2]: https://gist.github.com/nlindley/6409441 "Nicholas Lindley’s archivegenerator.rb"
[3]: https://gist.github.com/nlindley/6409459 "Nicholas Lindley’s archivepage.rb"
[4]: http://ilkka.github.io "Ilkka Laukkanen’s website"
[5]: https://gist.github.com/ilkka/707909 "Ilkka Laukkanen’s archivegenerator.rb"
[6]: https://gist.github.com/ilkka/707020 "Ilkka Laukkanen’s archivepage.rb"
[7]: http://marktrapp.com "Mark Trapp’s website"
[8]: http://marktrapp.com/projects/jekyll-archive "jekyll-archive project page"
[9]: https://rubygems.org/gems/jekyll-itafroma-archive "RubyGems project page"
