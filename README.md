# Jekyll Archive Generator

This plugin creates a set of archive pages for a Jekyll website.

Oddly, Jekyll doesn't include a date-based archive for posts out of the box. For example, if you have a permalink structure like `blog/2014/01/01/title, URL hacking won't work because going to `blog/2014` will return 404 Page Not Found.

Jekyll Archive Generator fixes that by generating all the necessary archive pages for each part of your blog URL structure.

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

This plugin's configuration is contained within the `archive` key and supports multiple archives:

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

### Directives

All directives are optional.

#### layout

The name of the layout to use for the archive pages. An example layout named `archive.html` is included in this repository. See **Usage** below for more information.

**Default value:** `archive`

#### path

The path where the archive should be generated.

**Default value:** `/`

#### title

The title of the archive pages. It has one token, `:date`, that will be replaced with a pretty version of the date.

**Default value:** `Blog archive — :date`

#### include

A mapping of front matter keys used to "whitelist" posts for the archive. Each key in the mapping is an array of strings for that specific key to include. This is conjunctive: if a post matches at least one condition, it will be included in the archive.

For example, `categories: ['foo', 'bar']` will ensure that only posts in the `foo` or `bar` categories will be included in the archive.

If `include` is not present, all posts will be included in the archive.

**Default value:** empty (all posts will be included)

#### exclude

A mapping of front matter keys used to exclude posts from the archive. Each key in the sequence is an array of strings for that specific key to exclude. 

For example, `categories: ['foo', 'bar']` will exclude any post that has the `foo` or `bar` category.

Exclusion filters are run *after* inclusion criteria specified by the `include` directive.

**Default value:** empty (no posts will be excluded)

## Usage

An example layout named `archive.html` is included in this repository. Two variables are exposed to the archive layout:

### page.archive.posts

The collection of posts for the specific time period in the archive. For example, `page.archive.posts` will only contain posts from May 2014 in the May 2014 archive page.

### page.archive.paginator

A paginator to navigate between archive pages at a specific date "resolution". For example, on the archive page for May 2014, the paginator will let you navigate between months. On the archive page for May 26, 2014, the paginator will let you navigate between days.

This paginator contains many of the same values found in [Jekyll's native paginator][1] (description of variables copied from that page):

* `page.archive.paginator.page`: the current page number
* `page.archive.paginator.total_pages`: the number of pagination pages
* `page.archive.paginator.previous_page`: the page number of the previous pagination page, or `nil` if no previous page exists
* `page.archive.paginator.previous_page_path`: the path of previous pagination page, or `nil` if no previous page exists
* `page.archive.paginator.next_page`: the page number of the next pagination page, or `nil` if no subsequent page exists
* `page.archive.paginator.next_page_path`: the path of next pagination page, or `nil` if no subsequent page exists

## Acknowledgments

This plug is inspired by the work done by [Nicholas Lindley][2]:

* [archivepage.rb][3]
* [archivegenerator.rb][4]

And by [Ilkka Laukkanen][5]:

* [archivepage.rb][6]
* [archivegenerator.rb][7]

## Copyright and license

This plugin is copyright © 2013–2015 [Mark Trapp][8]. All rights reserved. It is made available via the MIT license. A copy of the license can be found in the `LICENSE` file.

## Related links

* [Canonical project page][9]
* [RubyGems project page][10]

[1]: http://jekyllrb.com/docs/pagination/ "Jekyll Documentation — Pagination"
[2]: http://www.thisoneplace.com "Nicholas Lindley’s website"
[3]: https://gist.github.com/nlindley/6409441 "Nicholas Lindley’s archivegenerator.rb"
[4]: https://gist.github.com/nlindley/6409459 "Nicholas Lindley’s archivepage.rb"
[5]: http://ilkka.github.io "Ilkka Laukkanen’s website"
[6]: https://gist.github.com/ilkka/707909 "Ilkka Laukkanen’s archivegenerator.rb"
[7]: https://gist.github.com/ilkka/707020 "Ilkka Laukkanen’s archivepage.rb"
[8]: http://marktrapp.com "Mark Trapp’s website"
[9]: http://marktrapp.com/projects/jekyll-archive "jekyll-archive project page"
[10]: https://rubygems.org/gems/jekyll-itafroma-archive "RubyGems project page"
