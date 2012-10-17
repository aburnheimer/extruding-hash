Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'extruding-hash'
  s.version     = '0.9.0'
  s.summary     = %q{Hash structure for histograms}

  s.description = %q{Data structure, based on a Hash of Arrays, that
provides a method or two to gather data together in what can be
considered "bins".}

  s.license     = 'CC-BY-3.0'

  s.author      = 'Andrew Burnheimer'
  s.email       = 'Andrew_Burnheimer@cable.comcast.com'
  s.homepage    = 'https://github.com/aburnheimer/extruding-hash'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  # no dependencies
end
