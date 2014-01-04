# Jekyll Archive Generator

This plugin creates a set of archive pages for a Jekyll website.

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

This plugin has a few configuration options:

```yaml
archive:
    layout: archive
    path: /blog
    title: Blog Archive - :date
    exclude: ['projects']
```

* **layout**: The name of the layout to use for the archive pages. An example
  layout named `archive.html` is included in this repository.
* **path:** The path where the archive should be generated.
* **title:** The title of he archive pages. It has one token, `:date`, that will
  be replaced with a pretty version of the date.
* **exclude:** An array of categories to exclude from the archive.

## Acknowledgements

This plug is inspired by the work done by [Nicholas Lindley][1]:

* [archivepage.rb][2]
* [archivegenerator.rb][3]

And by [Ilkka Laukkanen][4]:

* [archivepage.rb][5]
* [archivegenerator.rb][6]

## Copyright and license

This plugin is copyright © 2013 [Mark Trapp][7]. All rights reserved. It is made
available via the MIT license. A copy of the license can be found in the
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
