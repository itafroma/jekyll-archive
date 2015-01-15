Gem::Specification.new do |s|
  s.name        = 'jekyll-itafroma-archive'
  s.version     = '0.4.2'
  s.date        = '2015-01-15'
  s.summary     = 'Jekyll plugin to create a set of archive pages.'
  s.description = <<-EOF
    Jekyll Archive Generator creates a set of archive pages for a Jekyll
    website.

    Oddly, Jekyll doesn't include a date-based archive for posts out of the box.
    For example, if you have a permalink structure like `blog/2014/01/01/title,
    URL hacking won't work because going to `blog/2014` will return 404 Page Not
    Found.

    Jekyll Archive Generator fixes that by generating all the necessary archive
    pages for each part your blog URL structure.
  EOF
  s.authors     = ['Mark Trapp']
  s.email       = 'mark@marktrapp.com'
  s.files       = [
    'lib/jekyll/itafroma/archive.rb',
    'lib/jekyll/itafroma/archive_generator.rb',
    'lib/jekyll/itafroma/archive_page.rb',
    'lib/jekyll/itafroma/archive_pager.rb',
    'lib/jekyll/itafroma/archive_substitution.rb',
  ]
  s.homepage    = 'http://marktrapp.com/projects/jekyll-archive'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 2.0.0'
  s.add_runtime_dependency 'jekyll', '~> 2.1'
end
