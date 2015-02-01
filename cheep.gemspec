description = <<DESCRIPTION
A Ruby DSL for writing Pure Data patches. Why? Because graphical programming
isn't any fun.
DESCRIPTION

Gem::Specification.new do |gem|
  gem.name        = 'cheep'
  gem.version     = '0.0.6'
  gem.summary     = 'Making noise.'
  gem.description = description
  gem.summary     = 'A Ruby DSL for writing Pure Data patches'
  gem.authors     = ['Louis Pilfold']
  gem.email       = 'louis@lpil.uk'
  gem.homepage    = 'http://github.com/lpil/cheep'
  gem.license     = 'MPL v2'

  gem.files       = `git ls-files lib spec *.md LICENCE`.split("\n")
  gem.test_files  = gem.files.grep(/\A(test|spec|features)/)

  gem.add_dependency 'blankslate', '~> 3'

  gem.add_development_dependency 'rspec', '~>3.1'
  gem.add_development_dependency 'rubocop', '~> 0.28'
  gem.add_development_dependency 'pry', '~> 0.10'
  gem.add_development_dependency 'flog'
  gem.add_development_dependency 'flay'
  gem.add_development_dependency 'reek'
end
