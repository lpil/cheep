Gem::Specification.new do |s|
  s.name        = 'cheep'
  s.version     = '0.0.4'
  s.date        = '2014-09-16'
  s.summary     = 'Making noise.'
  s.description = 'A Ruby DSL for writing Pure Data patches'
  s.authors     = ['Louis Pilfold']
  s.email       = 'louis@lpil.uk'
  s.files       = `git ls-files lib spec *.md LICENCE`.split("\n")
  s.homepage    = 'http://github.com/lpil/cheep'
  s.license     = 'MPL v2'
end
